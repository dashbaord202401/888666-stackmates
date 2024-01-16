-- AlterTable
ALTER TABLE "practice"."provider_performance" ADD COLUMN     "utc_date_report_from" DATE,
ADD COLUMN     "utc_date_report_to" DATE;

-- AlterTable
ALTER TABLE "practice"."snapshot_incomplete_exams" ADD COLUMN     "utc_date_report_from" DATE,
ADD COLUMN     "utc_date_report_to" DATE;

-- AlterTable
ALTER TABLE "practice"."snapshot_provider_saturation" ADD COLUMN     "utc_date_report_from" DATE,
ADD COLUMN     "utc_date_report_to" DATE;

-- AlterTable
ALTER TABLE "practice"."snapshot_revenue_items" ADD COLUMN     "utc_date_report_from" DATE,
ADD COLUMN     "utc_date_report_to" DATE;
