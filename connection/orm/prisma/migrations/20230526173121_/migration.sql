/*
  Warnings:

  - You are about to drop the `expense_payment` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_business_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_creditor_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_ledger_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payment" DROP CONSTRAINT "expense_payment_recurring_expense_id_fkey";

-- DropTable
DROP TABLE "drmg"."expense_payment";

-- CreateTable
CREATE TABLE "drmg"."expense_payments" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL DEFAULT 'actual',
    "business_id" INTEGER NOT NULL,
    "ledger_id" INTEGER NOT NULL,
    "creditor_id" INTEGER,
    "amount" DOUBLE PRECISION NOT NULL,
    "date_due" TIMESTAMP(3) NOT NULL,
    "date_paid" TIMESTAMP(3) NOT NULL,
    "description" TEXT,
    "invoice_no" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "recurring_expense_id" INTEGER,

    CONSTRAINT "expense_payments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."expense_resource_hours" (
    "id" SERIAL NOT NULL,
    "expense_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "unit_quantity" DOUBLE PRECISION NOT NULL,
    "unit_rate" DOUBLE PRECISION NOT NULL,
    "value_amount" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "expense_resource_hours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."expense_material_items" (
    "id" SERIAL NOT NULL,
    "expense_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "unit_quantity" DOUBLE PRECISION NOT NULL,
    "unit_cost" DOUBLE PRECISION NOT NULL,
    "value_amount" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "expense_material_items_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "drmg"."business_org"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_ledger_id_fkey" FOREIGN KEY ("ledger_id") REFERENCES "drmg"."ledger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_creditor_id_fkey" FOREIGN KEY ("creditor_id") REFERENCES "drmg"."business_org"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_recurring_expense_id_fkey" FOREIGN KEY ("recurring_expense_id") REFERENCES "drmg"."recurring_expense"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_resource_hours" ADD CONSTRAINT "expense_resource_hours_expense_id_fkey" FOREIGN KEY ("expense_id") REFERENCES "drmg"."expense_payments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_material_items" ADD CONSTRAINT "expense_material_items_expense_id_fkey" FOREIGN KEY ("expense_id") REFERENCES "drmg"."expense_payments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
