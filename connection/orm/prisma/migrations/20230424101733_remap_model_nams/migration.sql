-- AddForeignKey
ALTER TABLE "practice"."condition_injuries" ADD CONSTRAINT "condition_injuries_condition_id_fkey" FOREIGN KEY ("condition_id") REFERENCES "practice"."conditions"("condition_id") ON DELETE RESTRICT ON UPDATE CASCADE;
