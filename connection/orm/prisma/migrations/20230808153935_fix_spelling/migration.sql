/*
  Warnings:

  - You are about to drop the column `businessFunctionId` on the `expense_payments` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "drmg"."expense_payments" DROP CONSTRAINT "expense_payments_businessFunctionId_fkey";

-- AlterTable
ALTER TABLE "drmg"."expense_payments" DROP COLUMN "businessFunctionId",
ADD COLUMN     "business_function_id" INTEGER;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_business_function_id_fkey" FOREIGN KEY ("business_function_id") REFERENCES "drmg"."business_functions"("id") ON DELETE SET NULL ON UPDATE CASCADE;
