/*
  Warnings:

  - A unique constraint covering the columns `[assessment_id,assessment_goal_id,goal_type_id,goal_details]` on the table `treatment_goal_outcomes` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "warehouse"."treatment_goal_outcomes_assessment_id_assessment_goal_id_go_key";

-- CreateIndex
CREATE UNIQUE INDEX "treatment_goal_outcomes_assessment_id_assessment_goal_id_go_key" ON "warehouse"."treatment_goal_outcomes"("assessment_id", "assessment_goal_id", "goal_type_id", "goal_details");
