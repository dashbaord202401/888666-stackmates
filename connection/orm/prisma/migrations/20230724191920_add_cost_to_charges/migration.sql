-- AlterTable
ALTER TABLE "practice"."appointment_charges" ADD COLUMN     "report_provider_cost" DECIMAL DEFAULT 0,
ADD COLUMN     "report_provider_hourly_rate" DECIMAL DEFAULT 0,
ADD COLUMN     "reprocess_ind" INTEGER DEFAULT 0;
