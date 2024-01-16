'use client';

import { Button } from '@shared/ui/rsc';
import { ToastAction } from '@shared/ui';
import { useToast } from '@shared/ui';

export default function ToastDestructive() {
  const { toast } = useToast();

  return (
    <Button
      variant="outline"
      onClick={() => {
        toast({
          variant: 'destructive',
          title: 'Uh oh! Something went wrong.',
          description: 'There was a problem with your request.',
          action: <ToastAction altText="Try again">Try again</ToastAction>,
        });
      }}
    >
      Show Toast
    </Button>
  );
}
