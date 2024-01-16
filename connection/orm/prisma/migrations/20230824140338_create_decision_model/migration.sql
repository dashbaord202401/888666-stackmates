/*
  Warnings:

  - You are about to drop the column `organisation_id` on the `human_contact_problems` table. All the data in the column will be lost.
  - You are about to drop the `business_metric_triggers` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `drmg_org_id` to the `human_contact_problems` table without a default value. This is not possible if the table is not empty.
  - Made the column `drmg_org_id` on table `human_contacts` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `trigger_type` to the `business_metric_benchmarks` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "drmg"."business_metric_triggers" DROP CONSTRAINT "business_metric_triggers_metric_id_fkey";

-- AlterTable
ALTER TABLE "drmg"."human_contact_problems" DROP COLUMN "organisation_id",
ADD COLUMN     "drmg_org_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "drmg"."human_contacts" ALTER COLUMN "drmg_org_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "practice"."system_users" ADD COLUMN     "drmg_org_id" INTEGER;

-- AlterTable
ALTER TABLE "warehouse"."business_metric_benchmarks" ADD COLUMN     "decision_id" INTEGER,
ADD COLUMN     "trigger_type" TEXT NOT NULL;

-- DropTable
DROP TABLE "drmg"."business_metric_triggers";

-- CreateTable
CREATE TABLE "drmg"."decision_log" (
    "id" SERIAL NOT NULL,
    "date_required" TIMESTAMP(3) NOT NULL,
    "date_decided" TIMESTAMP(3) NOT NULL,
    "date_execute_started" TIMESTAMP(3) NOT NULL,
    "date_execute_ended" TIMESTAMP(3) NOT NULL,
    "category" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "desired_outcomes" TEXT NOT NULL,
    "constraints" TEXT NOT NULL,
    "stakeholders" TEXT NOT NULL,
    "information_sources" TEXT NOT NULL,
    "available_options" TEXT NOT NULL,
    "chosen_option" TEXT NOT NULL,
    "reasoning" TEXT NOT NULL,
    "risk_level" TEXT NOT NULL,
    "risk_summary" TEXT NOT NULL,
    "negative_side_effects" TEXT NOT NULL,
    "probability_of_failure" DOUBLE PRECISION NOT NULL,
    "positive_side_effects" TEXT NOT NULL,
    "probability_of_success" DOUBLE PRECISION NOT NULL,
    "decision_makers" TEXT NOT NULL,
    "confidence_level" TEXT NOT NULL,
    "reverse_strategy" TEXT NOT NULL,
    "outcome_results" TEXT NOT NULL,
    "outcome_date" TIMESTAMP(3) NOT NULL,
    "outcomes_vs_expectations_review" TEXT NOT NULL,
    "outcome_lessons_learned" TEXT NOT NULL,

    CONSTRAINT "decision_log_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "warehouse"."business_metric_benchmarks" ADD CONSTRAINT "business_metric_benchmarks_decision_id_fkey" FOREIGN KEY ("decision_id") REFERENCES "drmg"."decision_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;
