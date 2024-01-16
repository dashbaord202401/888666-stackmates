/*
  Warnings:

  - You are about to drop the column `related_documents` on the `business_function_procedures` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "drmg"."business_function_procedures" DROP COLUMN "related_documents";

-- CreateTable
CREATE TABLE "warehouse"."treatment_goal_outcomes" (
    "id" SERIAL NOT NULL,
    "asssessment_goal_id" INTEGER NOT NULL,
    "assessment_id" INTEGER NOT NULL,
    "owner_id" INTEGER NOT NULL,
    "owner_type" VARCHAR(50) NOT NULL,
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(50) NOT NULL,
    "con_date_of_injury" DATE,
    "client_id" INTEGER NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "condition_problems" VARCHAR(255) NOT NULL,
    "discharged_condition_problems" VARCHAR(255) NOT NULL,
    "goal_type_id" INTEGER NOT NULL,
    "goal_name" VARCHAR(255) NOT NULL,
    "goal_details" TEXT NOT NULL,
    "goal_activity" VARCHAR(255) NOT NULL,
    "goal_activity_details" TEXT NOT NULL,
    "estimate_appt_count" INTEGER NOT NULL DEFAULT 0,
    "current_appt_count" INTEGER NOT NULL DEFAULT 0,
    "discharged_appt_count" INTEGER NOT NULL DEFAULT 0,
    "goal_timeframe_interval" INTEGER NOT NULL DEFAULT 0,
    "goal_timeframe_id" INTEGER NOT NULL,
    "goal_timeframe" VARCHAR(255) NOT NULL,
    "goal_start_by_date" DATE,
    "goal_started_date" DATE,
    "goal_complete_by_date" DATE,
    "goal_completed_date" DATE,
    "goal_achieved_ind" INTEGER NOT NULL DEFAULT 0,
    "goal_deleted_ind" INTEGER NOT NULL DEFAULT 0,
    "discharged_date_first_appt" DATE,
    "discharged_date_discharged" DATE,
    "discharged_outcome_id" INTEGER NOT NULL,
    "discharged_outcome_type" VARCHAR(255) NOT NULL,
    "discharged_outcome_details" TEXT NOT NULL,
    "discharged_date_for_followup" DATE,
    "discharged_date_followup_completed" DATE,
    "auto_date_for_followup" DATE,
    "auto_date_followup_completed" DATE,
    "goal_notes" TEXT NOT NULL,
    "goal_plan_notes" TEXT NOT NULL,
    "goal_mid_notes" TEXT NOT NULL,
    "goal_final_notes" TEXT NOT NULL,
    "goal_non_completion_notes" TEXT NOT NULL,
    "estimate_journey_days" INTEGER NOT NULL DEFAULT 0,
    "actual_journey_days" INTEGER NOT NULL DEFAULT 0,
    "year_goal_started" INTEGER NOT NULL DEFAULT 0,
    "quarter_goal_started" INTEGER NOT NULL DEFAULT 0,
    "month_goal_started" INTEGER NOT NULL DEFAULT 0,
    "week_goal_started" INTEGER NOT NULL DEFAULT 0,
    "followup_notes" TEXT NOT NULL,
    "email_out_events" INTEGER NOT NULL DEFAULT 0,
    "message_out_events" INTEGER NOT NULL DEFAULT 0,
    "timestamp_update" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "treatment_goal_outcomes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "treatment_goal_outcomes_asssessment_goal_id_key" ON "warehouse"."treatment_goal_outcomes"("asssessment_goal_id");

-- CreateIndex
CREATE INDEX "treatment_goal_outcomes_provider_id_provider_name_idx" ON "warehouse"."treatment_goal_outcomes"("provider_id", "provider_name");

-- CreateIndex
CREATE INDEX "treatment_goal_outcomes_goal_type_id_goal_name_idx" ON "warehouse"."treatment_goal_outcomes"("goal_type_id", "goal_name");

-- CreateIndex
CREATE INDEX "treatment_goal_outcomes_goal_achieved_ind_idx" ON "warehouse"."treatment_goal_outcomes"("goal_achieved_ind");

-- CreateIndex
CREATE INDEX "treatment_goal_outcomes_discharged_outcome_type_idx" ON "warehouse"."treatment_goal_outcomes"("discharged_outcome_type");

-- CreateIndex
CREATE INDEX "treatment_goal_outcomes_estimate_appt_count_current_appt_co_idx" ON "warehouse"."treatment_goal_outcomes"("estimate_appt_count", "current_appt_count", "discharged_appt_count");

-- CreateIndex
CREATE INDEX "treatment_goal_outcomes_year_goal_started_quarter_goal_star_idx" ON "warehouse"."treatment_goal_outcomes"("year_goal_started", "quarter_goal_started", "month_goal_started", "week_goal_started");
