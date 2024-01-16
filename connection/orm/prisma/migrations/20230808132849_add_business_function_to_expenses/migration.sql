-- AlterTable
ALTER TABLE "drmg"."expense_payments" ADD COLUMN     "businessFunctionId" INTEGER;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_businessFunctionId_fkey" FOREIGN KEY ("businessFunctionId") REFERENCES "drmg"."business_functions"("id") ON DELETE SET NULL ON UPDATE CASCADE;
