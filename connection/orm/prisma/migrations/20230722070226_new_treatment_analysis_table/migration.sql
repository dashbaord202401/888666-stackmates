/*
  Warnings:

  - You are about to drop the column `auto_date_followup_completed` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `auto_date_for_followup` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `discharged_condition_problems` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `discharged_date_followup_completed` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `discharged_date_for_followup` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `discharged_outcome_details` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `email_out_events` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `followup_notes` on the `treatment_goal_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `message_out_events` on the `treatment_goal_outcomes` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" DROP COLUMN "auto_date_followup_completed",
DROP COLUMN "auto_date_for_followup",
DROP COLUMN "discharged_condition_problems",
DROP COLUMN "discharged_date_followup_completed",
DROP COLUMN "discharged_date_for_followup",
DROP COLUMN "discharged_outcome_details",
DROP COLUMN "email_out_events",
DROP COLUMN "followup_notes",
DROP COLUMN "message_out_events",
ADD COLUMN     "current_appt_hours" DOUBLE PRECISION DEFAULT 0;

-- CreateTable
CREATE TABLE "warehouse"."treatment_analysis" (
    "id" SERIAL NOT NULL,
    "owner_type" VARCHAR(50) NOT NULL,
    "owner_id" INTEGER NOT NULL,
    "assessment_id" INTEGER NOT NULL,
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(50) NOT NULL,
    "client_id" INTEGER NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "condition_problems" VARCHAR(255),
    "discharged_condition_problems" VARCHAR(255),
    "last_goal_name" VARCHAR(255),
    "last_goal_activity" VARCHAR(255),
    "total_goals_set" INTEGER DEFAULT 0,
    "all_goals_achieved_ind" INTEGER DEFAULT 0,
    "total_estimate_goal_appts" INTEGER DEFAULT 0,
    "clinical_appt_count" INTEGER DEFAULT 0,
    "discharged_appt_count" INTEGER DEFAULT 0,
    "clinical_appt_hours" DOUBLE PRECISION DEFAULT 0,
    "class_appt_hours" DOUBLE PRECISION DEFAULT 0,
    "success_support_hours" DOUBLE PRECISION DEFAULT 0,
    "direct_treatment_cost" DOUBLE PRECISION DEFAULT 0,
    "support_treatment_cost" DOUBLE PRECISION DEFAULT 0,
    "client_revenue" DOUBLE PRECISION DEFAULT 0,
    "third_party_revenue" DOUBLE PRECISION DEFAULT 0,
    "third_party_name" VARCHAR(255),
    "support_email_impressions" INTEGER DEFAULT 0,
    "support_phone_impressions" INTEGER DEFAULT 0,
    "support_msg_impressions" INTEGER DEFAULT 0,
    "support_social_media_impressions" INTEGER DEFAULT 0,
    "con_date_of_injury" DATE,
    "first_goal_start_by_date" DATE,
    "first_goal_started_date" DATE,
    "last_goal_complete_by_date" DATE,
    "last_goal_completed_date" DATE,
    "discharged_date_first_appt" DATE,
    "discharged_date_discharged" DATE,
    "discharged_outcome_id" INTEGER DEFAULT 0,
    "discharged_outcome_type" VARCHAR(255),
    "discharged_date_for_followup" DATE,
    "discharged_date_followup_completed" DATE,
    "template_date_for_followup" DATE,
    "goal_notes_ind" INTEGER DEFAULT 0,
    "goal_plan_notes_ind" INTEGER DEFAULT 0,
    "goal_mid_notes_ind" INTEGER DEFAULT 0,
    "goal_final_notes_ind" INTEGER DEFAULT 0,
    "goal_non_completion_notes_ind" INTEGER DEFAULT 0,
    "discharge_outcome_details_ind" INTEGER DEFAULT 0,
    "followup_notes_ind" INTEGER DEFAULT 0,
    "goal_estimate_journey_days" INTEGER DEFAULT 0,
    "goal_actual_journey_days" INTEGER DEFAULT 0,
    "discharge_journey_days" INTEGER DEFAULT 0,
    "current_appt_span_days" INTEGER DEFAULT 0,
    "year_goal_started" INTEGER DEFAULT 0,
    "quarter_goal_started" INTEGER DEFAULT 0,
    "month_goal_started" INTEGER DEFAULT 0,
    "week_goal_started" INTEGER DEFAULT 0,
    "timestamp_update" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "treatment_analysis_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "treatment_analysis_provider_id_provider_name_idx" ON "warehouse"."treatment_analysis"("provider_id", "provider_name");

-- CreateIndex
CREATE INDEX "treatment_analysis_year_goal_started_quarter_goal_started_m_idx" ON "warehouse"."treatment_analysis"("year_goal_started", "quarter_goal_started", "month_goal_started", "week_goal_started");

-- CreateIndex
CREATE UNIQUE INDEX "treatment_analysis_owner_id_assessment_id_key" ON "warehouse"."treatment_analysis"("owner_id", "assessment_id");
