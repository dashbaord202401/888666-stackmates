/*
  Warnings:

  - You are about to drop the column `availabile_dur` on the `provider_performance` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "practice"."provider_performance" DROP COLUMN "availabile_dur",
ADD COLUMN     "available_dur" DECIMAL DEFAULT 0;
