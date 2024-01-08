import { CurrencyAmount, Token } from '@uniswap/sdk-core';
import { Pair, Route } from '@uniswap/v2-sdk';
import { createPublicClient, http, parseAbi } from 'viem';
import { mainnet } from 'wagmi';

import { scaffoldConfig } from '@mates/shared-web3-config';

import { getTargetNetwork } from './networks';

const publicClient = createPublicClient({
  chain: mainnet,
  transport: http(
    `${mainnet.rpcUrls.alchemy.http[0]}/${scaffoldConfig.alchemyApiKey}`
  ),
});

const ABI = parseAbi([
  'function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast)',
  'function token0() external view returns (address)',
  'function token1() external view returns (address)',
]);

export const fetchPriceFromUniswap = async (): Promise<number> => {
  const configuredNetwork = getTargetNetwork();
  if (
    configuredNetwork.nativeCurrency.symbol !== 'ETH' &&
    configuredNetwork.nativeCurrency.symbol !== 'SEP' &&
    !configuredNetwork.nativeCurrencyTokenAddress
  ) {
    return 0;
  }
  try {
    const DAI = new Token(1, '0x6B175474E89094C44Da98b954EedeAC495271d0F', 18);
    const TOKEN = new Token(
      1,
      configuredNetwork.nativeCurrencyTokenAddress ||
        '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
      18
    );
    const pairAddress = Pair.getAddress(TOKEN, DAI);

    const wagmiConfig = {
      address: pairAddress,
      abi: ABI,
    };

    const reserves = await publicClient.readContract({
      ...wagmiConfig,
      functionName: 'getReserves',
    });

    const token0Address = await publicClient.readContract({
      ...wagmiConfig,
      functionName: 'token0',
    });

    const token1Address = await publicClient.readContract({
      ...wagmiConfig,
      functionName: 'token1',
    });
    const token0 = [TOKEN, DAI].find(
      (token) => token.address === token0Address
    ) as Token;
    const token1 = [TOKEN, DAI].find(
      (token) => token.address === token1Address
    ) as Token;
    const pair = new Pair(
      CurrencyAmount.fromRawAmount(token0, reserves[0].toString()),
      CurrencyAmount.fromRawAmount(token1, reserves[1].toString())
    );
    const route = new Route([pair], TOKEN, DAI);
    const price = parseFloat(route.midPrice.toSignificant(6));
    return price;
  } catch (error) {
    console.error(
      'useNativeCurrencyPrice - Error fetching ETH price from Uniswap: ',
      error
    );
    return 0;
  }
};