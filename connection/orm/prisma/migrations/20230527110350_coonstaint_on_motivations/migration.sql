/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `human_motivations` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "drmg"."human_motivations" ALTER COLUMN "name" SET DATA TYPE TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "human_motivations_name_key" ON "drmg"."human_motivations"("name");
