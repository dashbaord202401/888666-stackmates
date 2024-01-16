-- CreateIndex
CREATE INDEX "treatment_goal_outcomes_assessment_id_assessment_goal_id_idx" ON "warehouse"."treatment_goal_outcomes"("assessment_id", "assessment_goal_id");
