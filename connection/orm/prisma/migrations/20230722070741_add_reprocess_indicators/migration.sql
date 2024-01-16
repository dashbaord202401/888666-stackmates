-- AlterTable
ALTER TABLE "warehouse"."treatment_analysis" ADD COLUMN     "reprocess_data_ind" INTEGER DEFAULT 0;

-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" ADD COLUMN     "reprocess_data_ind" INTEGER DEFAULT 0;
