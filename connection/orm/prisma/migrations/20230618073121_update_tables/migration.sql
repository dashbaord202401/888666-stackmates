/*
  Warnings:

  - You are about to drop the column `vendorId` on the `assessment_goals` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "practice"."assessment_goals" DROP COLUMN "vendorId",
ADD COLUMN     "vendor_id" INTEGER DEFAULT 0;
