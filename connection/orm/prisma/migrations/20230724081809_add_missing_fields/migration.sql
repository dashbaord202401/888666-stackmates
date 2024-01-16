-- AlterTable
ALTER TABLE "warehouse"."treatment_analysis" ADD COLUMN     "discharged_providers_seen" INTEGER DEFAULT 0;

-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" ADD COLUMN     "goal_final_notes_ind" INTEGER DEFAULT 0,
ADD COLUMN     "goal_mid_notes_ind" INTEGER DEFAULT 0,
ADD COLUMN     "goal_non_completion_notes_ind" INTEGER DEFAULT 0,
ADD COLUMN     "goal_notes_ind" INTEGER DEFAULT 0,
ADD COLUMN     "goal_plan_notes_ind" INTEGER DEFAULT 0;
