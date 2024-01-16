/*
  Warnings:

  - You are about to drop the column `monthly_cost` on the `software_products` table. All the data in the column will be lost.
  - You are about to drop the column `monthly_cost_threshold` on the `software_products` table. All the data in the column will be lost.
  - You are about to drop the column `notes` on the `software_products` table. All the data in the column will be lost.
  - Added the required column `updated_at` to the `business_metric_benchmarks` table without a default value. This is not possible if the table is not empty.

*/

-- AlterTable
ALTER TABLE "drmg"."software_products" DROP COLUMN "monthly_cost",
DROP COLUMN "monthly_cost_threshold",
DROP COLUMN "notes",
ADD COLUMN     "base_price" DOUBLE PRECISION,
ADD COLUMN     "has_free_version" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "pricing_notes" TEXT,
ADD COLUMN     "use_case_notes" TEXT;

-- AlterTable
ALTER TABLE "warehouse"."business_metric_benchmarks" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3);

update warehouse.business_metric_benchmarks set updated_at = created_at where updated_at is null;

ALTER TABLE "warehouse"."business_metric_benchmarks" 
ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;
