import { Label } from '@shared/ui/forms';
import { Card, CardContent } from '@shared/ui/rsc';

import DatePickerWithRange from './examples/date-picker-with-range';

export function DemoDatePicker() {
  return (
    <Card>
      <CardContent className="pt-6">
        <div className="space-y-2">
          <Label htmlFor="date" className="shrink-0">
            Pick a date
          </Label>
          <DatePickerWithRange className="[&>button]:w-[260px]" />
        </div>
      </CardContent>
    </Card>
  );
}
