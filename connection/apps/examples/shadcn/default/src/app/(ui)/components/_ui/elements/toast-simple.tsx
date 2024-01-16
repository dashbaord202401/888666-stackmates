'use client';

import { Button } from '@shared/ui/rsc';
import { useToast } from '@shared/ui';

export default function ToastSimple() {
  const { toast } = useToast();

  return (
    <Button
      variant="outline"
      onClick={() => {
        toast({
          description: 'Your message has been sent.',
        });
      }}
    >
      Show Toast
    </Button>
  );
}
