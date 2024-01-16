/*
  Warnings:

  - Made the column `updated_at` on table `business_metric_benchmarks` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "warehouse"."business_metric_benchmarks" ALTER COLUMN "updated_at" SET NOT NULL,
ALTER COLUMN "updated_at" DROP DEFAULT;
