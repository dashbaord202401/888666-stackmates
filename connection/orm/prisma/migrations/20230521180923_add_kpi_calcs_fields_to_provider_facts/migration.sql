-- AlterTable
ALTER TABLE "warehouse"."provider_facts" ADD COLUMN     "kpiClinicalSaturation" DOUBLE PRECISION DEFAULT 0,
ADD COLUMN     "kpiInserviceSaturation" DOUBLE PRECISION DEFAULT 0;
