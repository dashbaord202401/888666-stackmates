-- AlterTable
ALTER TABLE "practice"."snapshot_incomplete_exams" ADD COLUMN     "period_number" INTEGER,
ADD COLUMN     "report_period" VARCHAR(20);

-- AlterTable
ALTER TABLE "practice"."snapshot_provider_saturation" ADD COLUMN     "period_number" INTEGER;

-- AlterTable
ALTER TABLE "practice"."snapshot_revenue_items" ADD COLUMN     "period_number" INTEGER;
