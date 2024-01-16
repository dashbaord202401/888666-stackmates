-- AlterTable
ALTER TABLE "practice"."provider_performance" ALTER COLUMN "utc_date_report_from" SET DATA TYPE TIMESTAMPTZ(6),
ALTER COLUMN "utc_date_report_to" SET DATA TYPE TIMESTAMPTZ(6);

-- AlterTable
ALTER TABLE "practice"."snapshot_incomplete_exams" ALTER COLUMN "utc_date_report_from" SET DATA TYPE TIMESTAMPTZ(6),
ALTER COLUMN "utc_date_report_to" SET DATA TYPE TIMESTAMPTZ(6);

-- AlterTable
ALTER TABLE "practice"."snapshot_provider_saturation" ALTER COLUMN "utc_date_report_from" SET DATA TYPE TIMESTAMPTZ(6),
ALTER COLUMN "utc_date_report_to" SET DATA TYPE TIMESTAMPTZ(6);

-- AlterTable
ALTER TABLE "practice"."snapshot_revenue_items" ALTER COLUMN "utc_date_report_from" SET DATA TYPE TIMESTAMPTZ(6),
ALTER COLUMN "utc_date_report_to" SET DATA TYPE TIMESTAMPTZ(6);
