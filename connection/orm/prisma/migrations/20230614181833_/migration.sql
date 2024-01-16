/*
  Warnings:

  - A unique constraint covering the columns `[business_id,metric_id,date,period_number,grouped_by,group_entity,measured_period]` on the table `business_metric_results` will be added. If there are existing duplicate values, this will fail.
  - Made the column `value` on table `business_metric_results` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "warehouse"."business_metric_results" ADD COLUMN     "data_source" TEXT,
ADD COLUMN     "data_type" TEXT,
ADD COLUMN     "date_year" INTEGER,
ADD COLUMN     "day_of_week" TEXT,
ADD COLUMN     "period_number" INTEGER,
ADD COLUMN     "value_type" TEXT,
ALTER COLUMN "value" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "business_metric_results_business_id_metric_id_date_period_n_key" ON "warehouse"."business_metric_results"("business_id", "metric_id", "date", "period_number", "grouped_by", "group_entity", "measured_period");
