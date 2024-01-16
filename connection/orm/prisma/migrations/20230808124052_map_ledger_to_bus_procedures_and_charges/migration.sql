-- AlterTable
ALTER TABLE "drmg"."business_function_procedures" ADD COLUMN     "ledger_id" INTEGER;

-- AlterTable
ALTER TABLE "practice"."charges" ADD COLUMN     "ledger_id" INTEGER;

-- AddForeignKey
ALTER TABLE "practice"."charges" ADD CONSTRAINT "charges_ledger_id_fkey" FOREIGN KEY ("ledger_id") REFERENCES "drmg"."ledger"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_function_procedures" ADD CONSTRAINT "business_function_procedures_ledger_id_fkey" FOREIGN KEY ("ledger_id") REFERENCES "drmg"."ledger"("id") ON DELETE SET NULL ON UPDATE CASCADE;
