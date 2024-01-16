/*
  Warnings:

  - You are about to drop the column `home_address` on the `client_facts` table. All the data in the column will be lost.
  - You are about to drop the column `postal_address` on the `client_facts` table. All the data in the column will be lost.
  - You are about to drop the column `work_address` on the `client_facts` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "drmg"."expense_payments" ALTER COLUMN "date_due" DROP NOT NULL,
ALTER COLUMN "invoice_no" DROP NOT NULL;

-- AlterTable
ALTER TABLE "warehouse"."client_facts" DROP COLUMN "home_address",
DROP COLUMN "postal_address",
DROP COLUMN "work_address";
