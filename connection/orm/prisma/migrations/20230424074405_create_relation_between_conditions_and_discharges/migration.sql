/*
  Warnings:

  - A unique constraint covering the columns `[condition_id]` on the table `conditions` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "conditions_condition_id_key" ON "practice"."conditions"("condition_id");

-- AddForeignKey
ALTER TABLE "practice"."conditions_discharged" ADD CONSTRAINT "conditions_discharged_condition_id_fkey" FOREIGN KEY ("condition_id") REFERENCES "practice"."conditions"("condition_id") ON DELETE RESTRICT ON UPDATE CASCADE;
