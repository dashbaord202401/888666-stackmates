/*
  Warnings:

  - A unique constraint covering the columns `[owner_id,assessment_id,assessment_goal_id]` on the table `treatment_goal_outcomes` will be added. If there are existing duplicate values, this will fail.
  - Made the column `goal_details` on table `treatment_goal_outcomes` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "warehouse"."treatment_goal_outcomes_owner_id_assessment_id_assessment_g_key";

-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" ALTER COLUMN "goal_details" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "treatment_goal_outcomes_owner_id_assessment_id_assessment_g_key" ON "warehouse"."treatment_goal_outcomes"("owner_id", "assessment_id", "assessment_goal_id");
