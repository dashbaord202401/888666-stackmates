'use client';

import { useToast } from '@shared/ui';
import { Button } from '@shared/ui/rsc';

export default function ToastWithTitle() {
  const { toast } = useToast();

  return (
    <Button
      variant="outline"
      onClick={() => {
        toast({
          title: 'Uh oh! Something went wrong.',
          description: 'There was a problem with your request.',
        });
      }}
    >
      Show Toast
    </Button>
  );
}
