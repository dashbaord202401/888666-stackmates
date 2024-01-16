/*
  Warnings:

  - Added the required column `businessFunctionId` to the `ledger` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "drmg"."ledger" ADD COLUMN     "businessFunctionId" INTEGER NOT NULL,
ADD COLUMN     "parentCode" TEXT;

-- CreateTable
CREATE TABLE "drmg"."business_functions" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "business_functions_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "drmg"."ledger" ADD CONSTRAINT "ledger_businessFunctionId_fkey" FOREIGN KEY ("businessFunctionId") REFERENCES "drmg"."business_functions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
