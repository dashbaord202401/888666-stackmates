import { AlertCircle } from 'lucide-react';

import {
  Alert,
  AlertDescription,
  AlertTitle,
} from '@mates/shared-ui-shadcn/server';

export default function AlertDestructive() {
  return (
    <Alert variant="destructive">
      <AlertCircle className="h-4 w-4" />
      <AlertTitle>Error</AlertTitle>
      <AlertDescription>
        Your session has expired. Please log in again.
      </AlertDescription>
    </Alert>
  );
}
