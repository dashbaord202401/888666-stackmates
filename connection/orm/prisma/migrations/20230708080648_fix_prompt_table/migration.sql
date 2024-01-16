/*
  Warnings:

  - You are about to drop the column `description` on the `ai_prompts` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "drmg"."ai_prompts" DROP COLUMN "description",
ADD COLUMN     "notes" TEXT,
ALTER COLUMN "discipline" DROP NOT NULL,
ALTER COLUMN "function" DROP NOT NULL,
ALTER COLUMN "industry" DROP NOT NULL,
ALTER COLUMN "tags" DROP NOT NULL;
