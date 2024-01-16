import Link from 'next/link';

import { Button } from '@shared/ui/rsc';

export default function ButtonAsChild() {
  return (
    <Button asChild>
      <Link href="/login">Login</Link>
    </Button>
  );
}
