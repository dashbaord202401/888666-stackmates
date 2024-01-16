import { Italic } from 'lucide-react';

import { Toggle } from '@shared/ui';

export default function ToggleOutline() {
  return (
    <Toggle variant="outline" aria-label="Toggle italic">
      <Italic className="h-4 w-4" />
    </Toggle>
  );
}
