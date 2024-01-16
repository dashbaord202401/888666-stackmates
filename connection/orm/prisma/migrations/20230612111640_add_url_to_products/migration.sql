/*
  Warnings:

  - You are about to drop the column `api_integrations` on the `software_products` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "drmg"."software_products" DROP COLUMN "api_integrations",
ADD COLUMN     "api_integration_count" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "monthly_cost" DOUBLE PRECISION,
ADD COLUMN     "monthly_cost_threshold" DOUBLE PRECISION,
ADD COLUMN     "url" TEXT;
