/*
  Warnings:

  - A unique constraint covering the columns `[business_id,metric_id,data_type,data_source,date,grouped_by,group_entity_id,measured_period,measured_item]` on the table `business_metric_results` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "warehouse"."business_metric_results_business_id_metric_id_data_type_dat_key";

-- CreateIndex
CREATE UNIQUE INDEX "business_metric_results_business_id_metric_id_data_type_dat_key" ON "warehouse"."business_metric_results"("business_id", "metric_id", "data_type", "data_source", "date", "grouped_by", "group_entity_id", "measured_period", "measured_item");
