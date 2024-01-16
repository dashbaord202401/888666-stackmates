import { Metadata } from 'next';
import Link from 'next/link';
import { ArrowRightIcon } from '@radix-ui/react-icons';

import { cn } from '@mates/shared-utils/server';

import { Separator } from '@mates/shared-ui-shadcn';
import { buttonVariants } from '@mates/shared-ui-shadcn/server';

import { ExamplesNav } from '../_components/examples-nav';
import {
  PageHeader,
  PageHeaderDescription,
  PageHeaderHeading,
} from '../_components/page-header';

export const metadata: Metadata = {
  title: 'Examples',
  description: 'Check out some examples app built using the components.',
};

interface ExamplesLayoutProps {
  children: React.ReactNode;
}

export default function ExamplesLayout({ children }: ExamplesLayoutProps) {
  return (
    <>
      <div className="container relative">
        <PageHeader className="page-header pb-8">
          <Link
            href="/docs/changelog"
            className="bg-muted inline-flex items-center rounded-lg px-3 py-1 text-sm font-medium"
          >
            🎉 <Separator className="mx-2 h-4" orientation="vertical" />{' '}
            <span className="sm:hidden">Style, a new CLI and more.</span>
            <span className="hidden sm:inline">
              Introducing Style, a new CLI and more.
            </span>
            <ArrowRightIcon className="ml-1 h-4 w-4" />
          </Link>
          <PageHeaderHeading className="hidden md:block">
            Check out some examples.
          </PageHeaderHeading>
          <PageHeaderHeading className="md:hidden">Examples</PageHeaderHeading>
          <PageHeaderDescription>
            Dashboard, cards, authentication. Some examples built using the
            components. Use this as a guide to build your own.
          </PageHeaderDescription>
          <section className="flex w-full items-center space-x-4 pb-8 pt-4 md:pb-10">
            <Link
              href="/docs"
              className={cn(buttonVariants(), 'rounded-[6px]')}
            >
              Get Started
            </Link>
            <Link
              href="/components"
              className={cn(
                buttonVariants({ variant: 'outline' }),
                'rounded-[6px]'
              )}
            >
              Components
            </Link>
          </section>
        </PageHeader>
        <section>
          <ExamplesNav />
          <div className="bg-background overflow-hidden rounded-[0.5rem] border shadow">
            {children}
          </div>
        </section>
      </div>
    </>
  );
}
