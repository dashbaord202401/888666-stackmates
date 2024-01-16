/*
  Warnings:

  - A unique constraint covering the columns `[business_id,metric_id,data_type,data_source,date,grouped_by,group_entity,measured_period]` on the table `business_metric_results` will be added. If there are existing duplicate values, this will fail.
  - Made the column `data_source` on table `business_metric_results` required. This step will fail if there are existing NULL values in that column.
  - Made the column `data_type` on table `business_metric_results` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "warehouse"."business_metric_results_business_id_metric_id_date_grouped__key";

-- AlterTable
ALTER TABLE "warehouse"."business_metric_results" ALTER COLUMN "data_source" SET NOT NULL,
ALTER COLUMN "data_type" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "business_metric_results_business_id_metric_id_data_type_dat_key" ON "warehouse"."business_metric_results"("business_id", "metric_id", "data_type", "data_source", "date", "grouped_by", "group_entity", "measured_period");
