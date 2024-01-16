/*
  Warnings:

  - Made the column `parentCode` on table `ledger` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "drmg"."ledger" ALTER COLUMN "parentCode" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "drmg"."ledger" ADD CONSTRAINT "ledger_parentCode_fkey" FOREIGN KEY ("parentCode") REFERENCES "drmg"."ledger"("code") ON DELETE RESTRICT ON UPDATE CASCADE;
