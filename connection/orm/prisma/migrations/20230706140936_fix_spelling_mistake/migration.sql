/*
  Warnings:

  - You are about to drop the column `asssessment_goal_id` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[assessment_goal_id]` on the table `treatment_goal_outcomes` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `assessment_goal_id` to the `treatment_goal_outcomes` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "warehouse"."treatment_goal_outcomes_asssessment_goal_id_key";

-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" DROP COLUMN "asssessment_goal_id",
ADD COLUMN     "assessment_goal_id" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "treatment_goal_outcomes_assessment_goal_id_key" ON "warehouse"."treatment_goal_outcomes"("assessment_goal_id");
