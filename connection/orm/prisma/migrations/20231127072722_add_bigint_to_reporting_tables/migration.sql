/*
  Warnings:

  - The primary key for the `map_debtors_clients` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "practice"."business_admin_analysis" ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "employee_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."business_metric_benchmarks" ALTER COLUMN "group_entity_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."business_metric_results" ALTER COLUMN "group_entity_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."client_facts" ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."client_revenue_summary" ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "debtor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "related_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."map_debtors_clients" DROP CONSTRAINT "map_debtors_clients_pkey",
ALTER COLUMN "debtor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ADD CONSTRAINT "map_debtors_clients_pkey" PRIMARY KEY ("debtor_id", "client_id");
