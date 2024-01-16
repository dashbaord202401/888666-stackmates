/*
  Warnings:

  - You are about to drop the column `kpiClinicalSaturation` on the `provider_facts` table. All the data in the column will be lost.
  - You are about to drop the column `kpiInserviceSaturation` on the `provider_facts` table. All the data in the column will be lost.
  - You are about to drop the `business_contact` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `business_org` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `contact` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `business_trade_partner` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `client_business_function_capabilities` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `client_motivations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `human_behaviours` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `human_capabilities` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `human_motivations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `human_traits` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `human_triggers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `human_values` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "drmg"."business_contact" DROP CONSTRAINT "business_contact_businessId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."business_contact" DROP CONSTRAINT "business_contact_contactId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."business_trade_partner" DROP CONSTRAINT "business_trade_partner_businessId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."business_trade_partner" DROP CONSTRAINT "business_trade_partner_tradePartnerId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."contact" DROP CONSTRAINT "contact_user_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payments" DROP CONSTRAINT "expense_payments_business_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."expense_payments" DROP CONSTRAINT "expense_payments_creditor_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."recurring_expense" DROP CONSTRAINT "recurring_expense_businessId_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."recurring_expense" DROP CONSTRAINT "recurring_expense_creditorId_fkey";

-- DropForeignKey
ALTER TABLE "warehouse"."client_business_function_capabilities" DROP CONSTRAINT "client_business_function_capabilities_business_function_id_fkey";

-- DropForeignKey
ALTER TABLE "warehouse"."client_business_function_capabilities" DROP CONSTRAINT "client_business_function_capabilities_client_id_fkey";

-- DropForeignKey
ALTER TABLE "warehouse"."client_motivations" DROP CONSTRAINT "client_motivations_client_id_fkey";

-- DropForeignKey
ALTER TABLE "warehouse"."client_motivations" DROP CONSTRAINT "client_motivations_motivation_id_fkey";

-- AlterTable
ALTER TABLE "drmg"."business_functions" ADD COLUMN     "function_type" TEXT;

-- AlterTable
ALTER TABLE "warehouse"."provider_facts" DROP COLUMN "kpiClinicalSaturation",
DROP COLUMN "kpiInserviceSaturation",
ADD COLUMN     "kpi_billable_saturation" DOUBLE PRECISION DEFAULT 0,
ADD COLUMN     "kpi_saturation" DOUBLE PRECISION DEFAULT 0;

-- DropTable
DROP TABLE "drmg"."business_contact";

-- DropTable
DROP TABLE "drmg"."business_org";

-- DropTable
DROP TABLE "drmg"."contact";

-- DropTable
DROP TABLE "warehouse"."business_trade_partner";

-- DropTable
DROP TABLE "warehouse"."client_business_function_capabilities";

-- DropTable
DROP TABLE "warehouse"."client_motivations";

-- DropTable
DROP TABLE "warehouse"."human_behaviours";

-- DropTable
DROP TABLE "warehouse"."human_capabilities";

-- DropTable
DROP TABLE "warehouse"."human_motivations";

-- DropTable
DROP TABLE "warehouse"."human_traits";

-- DropTable
DROP TABLE "warehouse"."human_triggers";

-- DropTable
DROP TABLE "warehouse"."human_values";

-- CreateTable
CREATE TABLE "drmg"."human_capabilities" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_capabilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."human_values" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."human_traits" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_traits_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."human_behaviours" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_behaviours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."human_triggers" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_triggers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."human_motivations" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_motivations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."human_contacts" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT,
    "mobile" TEXT,
    "user_id" TEXT,

    CONSTRAINT "human_contacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."contact_motivations" (
    "contact_id" INTEGER NOT NULL,
    "motivation_id" INTEGER NOT NULL,
    "subjective" TEXT,
    "subjective_rank" INTEGER DEFAULT 0,
    "objective" TEXT,
    "objective_rank" INTEGER DEFAULT 0,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "contact_motivations_pkey" PRIMARY KEY ("contact_id","motivation_id")
);

-- CreateTable
CREATE TABLE "drmg"."contact_business_function_capabilities" (
    "id" SERIAL NOT NULL,
    "contact_id" INTEGER NOT NULL,
    "business_function_id" INTEGER NOT NULL,
    "subjective" TEXT,
    "subjective_rank" INTEGER DEFAULT 0,
    "objective" TEXT,
    "objective_rank" INTEGER DEFAULT 0,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "contact_business_function_capabilities_pkey" PRIMARY KEY ("contact_id","business_function_id")
);

-- CreateTable
CREATE TABLE "drmg"."organisations" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "addressOne" TEXT,
    "addressTwo" TEXT,
    "postCode" TEXT,
    "country" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "organisations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."business_contacts" (
    "business_id" INTEGER NOT NULL,
    "contact_id" INTEGER NOT NULL,
    "currentlyActive" INTEGER NOT NULL DEFAULT 1,
    "connectionType" TEXT NOT NULL,
    "connectionNotes" TEXT,
    "email" VARCHAR(255),
    "mobile" VARCHAR(100),
    "country" VARCHAR(255),
    "location" VARCHAR(255),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_contacts_pkey" PRIMARY KEY ("business_id","contact_id")
);

-- CreateTable
CREATE TABLE "warehouse"."map_debtors_clients" (
    "debtor_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,

    CONSTRAINT "map_debtors_clients_pkey" PRIMARY KEY ("debtor_id","client_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "human_contacts_user_id_key" ON "drmg"."human_contacts"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "organisations_name_key" ON "drmg"."organisations"("name");

-- AddForeignKey
ALTER TABLE "drmg"."human_contacts" ADD CONSTRAINT "human_contacts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."contact_motivations" ADD CONSTRAINT "contact_motivations_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "drmg"."human_contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."contact_motivations" ADD CONSTRAINT "contact_motivations_motivation_id_fkey" FOREIGN KEY ("motivation_id") REFERENCES "drmg"."human_motivations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."contact_business_function_capabilities" ADD CONSTRAINT "contact_business_function_capabilities_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "drmg"."human_contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."contact_business_function_capabilities" ADD CONSTRAINT "contact_business_function_capabilities_business_function_i_fkey" FOREIGN KEY ("business_function_id") REFERENCES "drmg"."business_functions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_contacts" ADD CONSTRAINT "business_contacts_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_contacts" ADD CONSTRAINT "business_contacts_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "drmg"."human_contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_trade_partner" ADD CONSTRAINT "business_trade_partner_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_trade_partner" ADD CONSTRAINT "business_trade_partner_tradePartnerId_fkey" FOREIGN KEY ("tradePartnerId") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."recurring_expense" ADD CONSTRAINT "recurring_expense_creditorId_fkey" FOREIGN KEY ("creditorId") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."expense_payments" ADD CONSTRAINT "expense_payments_creditor_id_fkey" FOREIGN KEY ("creditor_id") REFERENCES "drmg"."organisations"("id") ON DELETE SET NULL ON UPDATE CASCADE;
