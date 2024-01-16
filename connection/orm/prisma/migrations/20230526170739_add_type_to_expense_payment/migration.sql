/*
  Warnings:

  - You are about to drop the column `businessId` on the `expense_payment` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `expense_payment` table. All the data in the column will be lost.
  - You are about to drop the column `creditorId` on the `expense_payment` table. All the data in the column will be lost.
  - You are about to drop the column `ledgerId` on the `expense_payment` table. All the data in the column will be lost.
  - You are about to drop the column `recurringExpenseId` on the `expense_payment` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `expense_payment` table. All the data in the column will be lost.
  - Added the required column `business_id` to the `expense_payment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ledger_id` to the `expense_payment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `expense_payment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_businessId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_creditorId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_ledgerId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_recurringExpenseId_fkey";

-- AlterTable
ALTER TABLE "drmg"."expense_payment" DROP COLUMN "businessId",
DROP COLUMN "createdAt",
DROP COLUMN "creditorId",
DROP COLUMN "ledgerId",
DROP COLUMN "recurringExpenseId",
DROP COLUMN "updatedAt",
ADD COLUMN     "business_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "creditor_id" INTEGER,
ADD COLUMN     "ledger_id" INTEGER NOT NULL,
ADD COLUMN     "recurring_expense_id" INTEGER,
ADD COLUMN     "type" TEXT NOT NULL DEFAULT 'actual',
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "warehouse"."client_facts" ADD COLUMN     "provider_id" INTEGER;

-- CreateTable
CREATE TABLE "warehouse"."client_business_function_capabilities" (
    "id" SERIAL NOT NULL,
    "client_id" INTEGER NOT NULL,
    "business_function_id" INTEGER NOT NULL,
    "subjective" TEXT,
    "subjective_rank" INTEGER DEFAULT 0,
    "objective" TEXT,
    "objective_rank" INTEGER DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "client_business_function_capabilities_pkey" PRIMARY KEY ("client_id","business_function_id")
);

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_ledger_id_fkey" FOREIGN KEY ("ledger_id") REFERENCES "drmg"."ledger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_creditor_id_fkey" FOREIGN KEY ("creditor_id") REFERENCES "drmg"."business_org"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payment" ADD CONSTRAINT "expense_payment_recurring_expense_id_fkey" FOREIGN KEY ("recurring_expense_id") REFERENCES "drmg"."recurring_expense"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."client_business_function_capabilities" ADD CONSTRAINT "client_business_function_capabilities_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "warehouse"."client_facts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."client_business_function_capabilities" ADD CONSTRAINT "client_business_function_capabilities_business_function_id_fkey" FOREIGN KEY ("business_function_id") REFERENCES "drmg"."business_functions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
