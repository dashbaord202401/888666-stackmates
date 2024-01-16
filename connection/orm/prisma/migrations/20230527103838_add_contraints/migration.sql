/*
  Warnings:

  - You are about to drop the column `email` on the `human_contacts` table. All the data in the column will be lost.
  - You are about to drop the column `businessId` on the `recurring_expense` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `recurring_expense` table. All the data in the column will be lost.
  - You are about to drop the column `creditorId` on the `recurring_expense` table. All the data in the column will be lost.
  - You are about to drop the column `ledgerId` on the `recurring_expense` table. All the data in the column will be lost.
  - You are about to drop the column `nextDueDate` on the `recurring_expense` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `recurring_expense` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name,userId]` on the table `Board` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `business_functions` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `human_behaviours` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `human_capabilities` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `human_traits` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `human_triggers` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `human_values` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[code]` on the table `ledger` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name,business_id]` on the table `recurring_expense` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `business_id` to the `recurring_expense` table without a default value. This is not possible if the table is not empty.
  - Added the required column `creditor_id` to the `recurring_expense` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ledger_id` to the `recurring_expense` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `recurring_expense` table without a default value. This is not possible if the table is not empty.
  - Added the required column `next_due_date` to the `recurring_expense` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `recurring_expense` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "drmg"."recurring_expense" DROP CONSTRAINT "recurring_expense_businessId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."recurring_expense" DROP CONSTRAINT "recurring_expense_creditorId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."recurring_expense" DROP CONSTRAINT "recurring_expense_ledgerId_fkey";

-- AlterTable
ALTER TABLE "drmg"."human_behaviours" ALTER COLUMN "name" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "drmg"."human_capabilities" ALTER COLUMN "name" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "drmg"."human_contacts" DROP COLUMN "email";

-- AlterTable
ALTER TABLE "drmg"."human_traits" ALTER COLUMN "name" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "drmg"."human_triggers" ALTER COLUMN "name" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "drmg"."human_values" ALTER COLUMN "name" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "drmg"."recurring_expense" DROP COLUMN "businessId",
DROP COLUMN "createdAt",
DROP COLUMN "creditorId",
DROP COLUMN "ledgerId",
DROP COLUMN "nextDueDate",
DROP COLUMN "updatedAt",
ADD COLUMN     "business_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "creditor_id" INTEGER NOT NULL,
ADD COLUMN     "ledger_id" INTEGER NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "next_due_date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "drmg"."problems" (
    "id" SERIAL NOT NULL,
    "category" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "problems_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "problems_name_key" ON "drmg"."problems"("name");

-- CreateIndex
CREATE UNIQUE INDEX "problems_category_name_key" ON "drmg"."problems"("category", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Board_name_userId_key" ON "drmg"."Board"("name", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "business_functions_name_key" ON "drmg"."business_functions"("name");

-- CreateIndex
CREATE UNIQUE INDEX "human_behaviours_name_key" ON "drmg"."human_behaviours"("name");

-- CreateIndex
CREATE UNIQUE INDEX "human_capabilities_name_key" ON "drmg"."human_capabilities"("name");

-- CreateIndex
CREATE UNIQUE INDEX "human_traits_name_key" ON "drmg"."human_traits"("name");

-- CreateIndex
CREATE UNIQUE INDEX "human_triggers_name_key" ON "drmg"."human_triggers"("name");

-- CreateIndex
CREATE UNIQUE INDEX "human_values_name_key" ON "drmg"."human_values"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ledger_code_key" ON "drmg"."ledger"("code");

-- CreateIndex
CREATE UNIQUE INDEX "recurring_expense_name_business_id_key" ON "drmg"."recurring_expense"("name", "business_id");

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_creditor_id_fkey" FOREIGN KEY ("creditor_id") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_ledger_id_fkey" FOREIGN KEY ("ledger_id") REFERENCES "drmg"."ledger"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
