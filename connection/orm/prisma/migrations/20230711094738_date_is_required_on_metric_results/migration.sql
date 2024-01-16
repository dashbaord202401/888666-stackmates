/*
  Warnings:

  - Made the column `date` on table `business_metric_results` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "warehouse"."business_metric_results" ALTER COLUMN "date" SET NOT NULL;
