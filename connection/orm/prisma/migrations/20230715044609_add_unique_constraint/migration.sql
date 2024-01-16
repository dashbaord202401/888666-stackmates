/*
  Warnings:

  - A unique constraint covering the columns `[assessment_id,assessment_goal_id]` on the table `treatment_goal_outcomes` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "warehouse"."treatment_goal_outcomes_assessment_goal_id_key";

-- DropIndex
DROP INDEX "warehouse"."treatment_goal_outcomes_assessment_id_assessment_goal_id_idx";

-- CreateIndex
CREATE UNIQUE INDEX "treatment_goal_outcomes_assessment_id_assessment_goal_id_key" ON "warehouse"."treatment_goal_outcomes"("assessment_id", "assessment_goal_id");
