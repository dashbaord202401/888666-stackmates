-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" ALTER COLUMN "goal_type_id" DROP NOT NULL,
ALTER COLUMN "assessment_goal_id" DROP NOT NULL;
