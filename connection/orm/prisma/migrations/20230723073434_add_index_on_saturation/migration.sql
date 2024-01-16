/*
  Warnings:

  - A unique constraint covering the columns `[date_report_from,date_report_to,provider_id,site_id,report_period]` on the table `snapshot_provider_saturation` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "snapshot_provider_saturation_date_report_from_date_report_t_key" ON "practice"."snapshot_provider_saturation"("date_report_from", "date_report_to", "provider_id", "site_id", "report_period");
