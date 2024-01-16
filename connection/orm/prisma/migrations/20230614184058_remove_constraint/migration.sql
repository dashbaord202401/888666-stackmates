/*
  Warnings:

  - A unique constraint covering the columns `[business_id,metric_id,date,grouped_by,group_entity,measured_period]` on the table `business_metric_results` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "warehouse"."business_metric_results_business_id_metric_id_date_period_n_key";

-- CreateIndex
CREATE UNIQUE INDEX "business_metric_results_business_id_metric_id_date_grouped__key" ON "warehouse"."business_metric_results"("business_id", "metric_id", "date", "grouped_by", "group_entity", "measured_period");
