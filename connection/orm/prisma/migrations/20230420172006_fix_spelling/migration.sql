/*
  Warnings:

  - You are about to drop the column `dna_charge_rev` on the `provider_performance` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "practice"."provider_performance" DROP COLUMN "dna_charge_rev",
ADD COLUMN     "dna_cancel_rev" DOUBLE PRECISION;
