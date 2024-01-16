/*
  Warnings:

  - You are about to drop the column `description` on the `expense_payments` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[ledger_id,date_paid,type,business_id,name]` on the table `expense_payments` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `expense_payments` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "drmg"."expense_payments" DROP COLUMN "description",
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "notes" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "expense_payments_ledger_id_date_paid_type_business_id_name_key" ON "drmg"."expense_payments"("ledger_id", "date_paid", "type", "business_id", "name");
