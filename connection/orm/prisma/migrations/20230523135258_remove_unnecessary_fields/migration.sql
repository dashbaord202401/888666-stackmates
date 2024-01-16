/*
  Warnings:

  - You are about to drop the column `product_group_name` on the `client_revenue_summary` table. All the data in the column will be lost.
  - You are about to drop the column `revenue_ledger_id` on the `client_revenue_summary` table. All the data in the column will be lost.
  - Made the column `related_id` on table `client_revenue_summary` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "warehouse"."client_revenue_summary" DROP COLUMN "product_group_name",
DROP COLUMN "revenue_ledger_id",
ALTER COLUMN "related_id" SET NOT NULL;
