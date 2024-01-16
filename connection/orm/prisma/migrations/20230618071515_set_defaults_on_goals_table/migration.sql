-- AlterTable
ALTER TABLE "practice"."assessment_goals" ALTER COLUMN "assessment_id" DROP NOT NULL,
ALTER COLUMN "assessment_id" SET DEFAULT 0,
ALTER COLUMN "goal_id" DROP NOT NULL,
ALTER COLUMN "goal_id" SET DEFAULT 0,
ALTER COLUMN "activity_id" DROP NOT NULL,
ALTER COLUMN "activity_id" SET DEFAULT 0,
ALTER COLUMN "timeframe" DROP NOT NULL,
ALTER COLUMN "timeframe" SET DEFAULT 0,
ALTER COLUMN "timeframe_type_id" DROP NOT NULL,
ALTER COLUMN "timeframe_type_id" SET DEFAULT 0,
ALTER COLUMN "achieved_ind" DROP NOT NULL;
