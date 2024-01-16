/*
  Warnings:

  - You are about to alter the column `client_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `client_tax_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `paid_by_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `paid_by_tax_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `invoiced_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `invoiced_tax_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `paid_by_invoiced_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `paid_by_invoiced_tax_amount` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `report_provider_cost` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.
  - You are about to alter the column `report_provider_hourly_rate` on the `appointment_charges` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `DoublePrecision`.

*/
-- AlterTable
ALTER TABLE "practice"."appointment_charges" ALTER COLUMN "client_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "client_tax_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "paid_by_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "paid_by_tax_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "invoiced_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "invoiced_tax_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "paid_by_invoiced_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "paid_by_invoiced_tax_amount" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "report_provider_cost" SET DATA TYPE DOUBLE PRECISION,
ALTER COLUMN "report_provider_hourly_rate" SET DATA TYPE DOUBLE PRECISION;
