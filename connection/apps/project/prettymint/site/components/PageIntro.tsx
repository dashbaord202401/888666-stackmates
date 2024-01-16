import React, { ReactNode } from 'react';
import clsx from 'clsx';

import { Container } from '../components/Container';
import { FadeIn } from '../components/FadeIn';

interface PageIntroProps {
  eyebrow: string;
  title: string;
  children: ReactNode;
  centered?: boolean;
}

export const PageIntro: React.FC<PageIntroProps> = ({
  eyebrow,
  title,
  children,
  centered = false,
}) => {
  return (
    <Container
      className={clsx('mt-24 sm:mt-32 lg:mt-40', centered && 'text-center')}
    >
      <FadeIn>
        <h1>
          <span className="font-display block text-base font-semibold text-neutral-950">
            {eyebrow}
          </span>
          <span className="sr-only"> - </span>
          <span
            className={clsx(
              'font-display mt-6 block max-w-5xl text-5xl font-medium tracking-tight text-neutral-950 [text-wrap:balance] sm:text-6xl',
              centered && 'mx-auto'
            )}
          >
            {title}
          </span>
        </h1>
        <div
          className={clsx(
            'mt-6 max-w-3xl text-xl text-neutral-600',
            centered && 'mx-auto'
          )}
        >
          {children}
        </div>
      </FadeIn>
    </Container>
  );
};
