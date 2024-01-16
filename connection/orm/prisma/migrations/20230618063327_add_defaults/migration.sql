-- AlterTable
ALTER TABLE "practice"."assessment_goals" ALTER COLUMN "vendorId" DROP NOT NULL,
ALTER COLUMN "vendorId" SET DEFAULT 0,
ALTER COLUMN "start_by_date" DROP NOT NULL,
ALTER COLUMN "started_date" DROP NOT NULL,
ALTER COLUMN "complete_by_date" DROP NOT NULL;
