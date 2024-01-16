/*
  Warnings:

  - You are about to drop the column `name` on the `business_role_rates` table. All the data in the column will be lost.
  - You are about to drop the column `conversations` on the `human_contacts` table. All the data in the column will be lost.
  - You are about to drop the `human_interactions` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `date_from` to the `business_role_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_to` to the `business_role_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `expertise` to the `business_role_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `job_function` to the `business_role_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `job_title` to the `business_role_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `contact_id` to the `employee_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_from` to the `employee_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_to` to the `employee_rates` table without a default value. This is not possible if the table is not empty.
  - Added the required column `drmg_org_id` to the `employee_rates` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "drmg"."human_interactions" DROP CONSTRAINT "human_interactions_contact_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."human_interactions" DROP CONSTRAINT "human_interactions_user_id_fkey";

-- AlterTable
ALTER TABLE "drmg"."ai_prompts" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."business_function_metrics" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."business_function_procedures" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."business_function_roles" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."business_role_rates" DROP COLUMN "name",
ADD COLUMN     "annual_salary" DOUBLE PRECISION,
ADD COLUMN     "country" VARCHAR(100),
ADD COLUMN     "currency" VARCHAR(100),
ADD COLUMN     "date_from" DATE NOT NULL,
ADD COLUMN     "date_to" DATE NOT NULL,
ADD COLUMN     "expertise" VARCHAR(100) NOT NULL,
ADD COLUMN     "hourly_rate" DOUBLE PRECISION,
ADD COLUMN     "job_function" VARCHAR(100) NOT NULL,
ADD COLUMN     "job_title" VARCHAR(100) NOT NULL,
ADD COLUMN     "monthly_rate" DOUBLE PRECISION,
ADD COLUMN     "region" VARCHAR(100),
ADD COLUMN     "weekly_rate" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "drmg"."employee_rates" ADD COLUMN     "annual_salary" DOUBLE PRECISION,
ADD COLUMN     "contact_id" INTEGER NOT NULL,
ADD COLUMN     "contractor_ind" INTEGER,
ADD COLUMN     "date_from" DATE NOT NULL,
ADD COLUMN     "date_to" DATE NOT NULL,
ADD COLUMN     "drmg_org_id" INTEGER NOT NULL,
ADD COLUMN     "hourly_rate" DOUBLE PRECISION,
ADD COLUMN     "role" VARCHAR(100);

-- AlterTable
ALTER TABLE "drmg"."expense_material_items" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."expense_payments" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."expense_resource_hours" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."human_contacts" DROP COLUMN "conversations";

-- AlterTable
ALTER TABLE "drmg"."ledger" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."recurring_expense" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "practice"."business_admin_analysis" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "public"."User" ADD COLUMN     "active_drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."business_metric_results" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."client_facts" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."client_revenue_summary" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."map_debtors_clients" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."performance" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."provider_facts" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."treatment_analysis" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" ADD COLUMN     "drmg_org_id" INTEGER;

-- DropTable
DROP TABLE "drmg"."human_interactions";

-- CreateTable
CREATE TABLE "drmg"."contact_interactions" (
    "id" SERIAL NOT NULL,
    "contact_id" INTEGER NOT NULL,
    "user_id" TEXT NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "agenda" TEXT,
    "notes" TEXT,

    CONSTRAINT "contact_interactions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."business_metric_benchmarks" (
    "id" SERIAL NOT NULL,
    "drmg_org_id" INTEGER NOT NULL,
    "metric_id" INTEGER NOT NULL,
    "grouped_by" TEXT NOT NULL,
    "group_entity" TEXT NOT NULL,
    "group_entity_id" INTEGER,
    "measured_item" TEXT,
    "threshold_value" DOUBLE PRECISION NOT NULL,
    "value_type" TEXT,
    "threshold_procedure_id" INTEGER,
    "date_from" TIMESTAMP(3) NOT NULL,
    "date_to" TIMESTAMP(3) NOT NULL,
    "period_number" INTEGER,
    "measured_period" TEXT NOT NULL,
    "day_of_week" TEXT,

    CONSTRAINT "business_metric_benchmarks_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "drmg"."contact_interactions" ADD CONSTRAINT "contact_interactions_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "drmg"."human_contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."contact_interactions" ADD CONSTRAINT "contact_interactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."business_metric_benchmarks" ADD CONSTRAINT "business_metric_benchmarks_drmg_org_id_fkey" FOREIGN KEY ("drmg_org_id") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."business_metric_benchmarks" ADD CONSTRAINT "business_metric_benchmarks_metric_id_fkey" FOREIGN KEY ("metric_id") REFERENCES "drmg"."business_function_metrics"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."business_metric_benchmarks" ADD CONSTRAINT "business_metric_benchmarks_threshold_procedure_id_fkey" FOREIGN KEY ("threshold_procedure_id") REFERENCES "drmg"."business_function_procedures"("id") ON DELETE SET NULL ON UPDATE CASCADE;
