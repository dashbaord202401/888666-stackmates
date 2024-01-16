/*
  Warnings:

  - You are about to alter the column `no_show_count` on the `provider_performance` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Integer`.
  - You are about to alter the column `in_service_count` on the `provider_performance` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Integer`.
  - You are about to alter the column `prv_count` on the `provider_performance` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Integer`.
  - You are about to alter the column `client_count` on the `provider_performance` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Integer`.
  - You are about to alter the column `class_count` on the `provider_performance` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Integer`.
  - You are about to alter the column `total_count` on the `provider_performance` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Integer`.

*/
-- AlterTable
ALTER TABLE "practice"."provider_performance" ADD COLUMN     "acc_schedule_rev" DOUBLE PRECISION,
ADD COLUMN     "adjusted" DOUBLE PRECISION,
ADD COLUMN     "appt_charge_rev" DOUBLE PRECISION,
ADD COLUMN     "client_charge_rev" DOUBLE PRECISION,
ADD COLUMN     "contract_rev" DOUBLE PRECISION,
ADD COLUMN     "dna_charge_rev" DOUBLE PRECISION,
ADD COLUMN     "insurer_schedule_rev" DOUBLE PRECISION,
ADD COLUMN     "product_rev" DOUBLE PRECISION,
ADD COLUMN     "rejected" DOUBLE PRECISION,
ADD COLUMN     "unique_client_count" INTEGER DEFAULT 0,
ALTER COLUMN "no_show_count" SET DEFAULT 0,
ALTER COLUMN "no_show_count" SET DATA TYPE INTEGER,
ALTER COLUMN "in_service_count" SET DEFAULT 0,
ALTER COLUMN "in_service_count" SET DATA TYPE INTEGER,
ALTER COLUMN "prv_count" SET DEFAULT 0,
ALTER COLUMN "prv_count" SET DATA TYPE INTEGER,
ALTER COLUMN "client_count" SET DEFAULT 0,
ALTER COLUMN "client_count" SET DATA TYPE INTEGER,
ALTER COLUMN "class_count" SET DEFAULT 0,
ALTER COLUMN "class_count" SET DATA TYPE INTEGER,
ALTER COLUMN "total_count" SET DEFAULT 0,
ALTER COLUMN "total_count" SET DATA TYPE INTEGER;
