/*
  Warnings:

  - You are about to drop the column `site_availability_dur` on the `provider_performance` table. All the data in the column will be lost.
  - You are about to drop the column `site_id` on the `provider_performance` table. All the data in the column will be lost.
  - You are about to drop the column `site_name` on the `provider_performance` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "practice"."provider_performance" DROP COLUMN "site_availability_dur",
DROP COLUMN "site_id",
DROP COLUMN "site_name",
ADD COLUMN     "availabile_dur" DECIMAL DEFAULT 0,
ALTER COLUMN "no_show_dur" SET DEFAULT 0,
ALTER COLUMN "in_service_dur" SET DEFAULT 0,
ALTER COLUMN "prv_dur" SET DEFAULT 0,
ALTER COLUMN "client_dur" SET DEFAULT 0,
ALTER COLUMN "class_dur" SET DEFAULT 0,
ALTER COLUMN "acc_schedule_rev" SET DEFAULT 0,
ALTER COLUMN "adjusted" SET DEFAULT 0,
ALTER COLUMN "appt_charge_rev" SET DEFAULT 0,
ALTER COLUMN "client_charge_rev" SET DEFAULT 0,
ALTER COLUMN "contract_rev" SET DEFAULT 0,
ALTER COLUMN "insurer_schedule_rev" SET DEFAULT 0,
ALTER COLUMN "product_rev" SET DEFAULT 0,
ALTER COLUMN "rejected" SET DEFAULT 0,
ALTER COLUMN "dna_cancel_rev" SET DEFAULT 0;
