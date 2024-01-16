-- DropForeignKey
ALTER TABLE "drmg"."clients_in_action_lists" DROP CONSTRAINT "clients_in_action_lists_client_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."appointment_charges" DROP CONSTRAINT "appointment_charges_provider_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."appointment_clients" DROP CONSTRAINT "appointment_clients_client_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."appointment_clients" DROP CONSTRAINT "appointment_clients_provider_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."appointment_conditions" DROP CONSTRAINT "appointment_conditions_condition_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."appointment_conditions" DROP CONSTRAINT "appointment_conditions_provider_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."appointments" DROP CONSTRAINT "appointments_client_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."appointments" DROP CONSTRAINT "appointments_provider_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."condition_injuries" DROP CONSTRAINT "condition_injuries_condition_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."conditions" DROP CONSTRAINT "conditions_provider_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."conditions_discharged" DROP CONSTRAINT "conditions_discharged_condition_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."snapshot_incomplete_exams" DROP CONSTRAINT "snapshot_incomplete_exams_site_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."snapshot_provider_saturation" DROP CONSTRAINT "snapshot_provider_saturation_provider_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."snapshot_provider_saturation" DROP CONSTRAINT "snapshot_provider_saturation_site_id_fkey";

-- DropForeignKey
ALTER TABLE "warehouse"."provider_facts" DROP CONSTRAINT "provider_facts_provider_id_fkey";

-- AlterTable
ALTER TABLE "drmg"."clients_in_action_lists" ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "actioned_by" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "drmg"."ledger" ALTER COLUMN "drmg_org_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."appointment_charges" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "appointment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "charge_type_id" SET DATA TYPE BIGINT,
ALTER COLUMN "paid_by_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."appointment_clients" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "deleted_ind" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."appointment_conditions" ALTER COLUMN "appointment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "condition_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."appointments" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "appointment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."assessment_goals" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "assessment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "goal_id" SET DATA TYPE BIGINT,
ALTER COLUMN "activity_id" SET DATA TYPE BIGINT,
ALTER COLUMN "timeframe_type_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."assessments" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "owner_id" SET DATA TYPE BIGINT,
ALTER COLUMN "owner_type_id" SET DATA TYPE BIGINT,
ALTER COLUMN "clinician_type_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."charges" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."clients" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "infusionsoft_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "title_id" SET DATA TYPE BIGINT,
ALTER COLUMN "home_site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "employer_id" SET DATA TYPE BIGINT,
ALTER COLUMN "why_choose_us_id" SET DATA TYPE BIGINT,
ALTER COLUMN "referral_source_id" SET DATA TYPE BIGINT,
ALTER COLUMN "referred_by_id" SET DATA TYPE BIGINT,
ALTER COLUMN "medical_centre_id" SET DATA TYPE BIGINT,
ALTER COLUMN "gp_id" SET DATA TYPE BIGINT,
ALTER COLUMN "occupation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "work_intensity_id" SET DATA TYPE BIGINT,
ALTER COLUMN "ethnic_group_id" SET DATA TYPE BIGINT,
ALTER COLUMN "unique_postal_address_ind" SET DATA TYPE BIGINT,
ALTER COLUMN "inactive_ind" SET DATA TYPE BIGINT,
ALTER COLUMN "deleted_ind" SET DATA TYPE BIGINT,
ALTER COLUMN "include_in_mailouts" SET DATA TYPE BIGINT,
ALTER COLUMN "class_type_total" SET DATA TYPE BIGINT,
ALTER COLUMN "conditions_total" SET DATA TYPE BIGINT,
ALTER COLUMN "contracts_total" SET DATA TYPE BIGINT,
ALTER COLUMN "products_total" SET DATA TYPE BIGINT,
ALTER COLUMN "cross_referral_total" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."condition_injuries" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "condition_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "injury_type_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."conditions" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "condition_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "authorisation_site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "referred_by_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "work_intensity_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."conditions_discharged" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "condition_id" SET DATA TYPE BIGINT,
ALTER COLUMN "outcome_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."conditions_discharged_outcomes" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "created_by_id" SET DATA TYPE BIGINT,
ALTER COLUMN "patient_assessment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "patient_assessment_owner_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."gensolve_meta_types" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "type_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."membership_usage" ALTER COLUMN "client_appointment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_membership_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "appointment_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."providers" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "organisation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "system_user_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."revenue_items" ALTER COLUMN "item_id" SET DATA TYPE BIGINT,
ALTER COLUMN "debtor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "related_id" SET DATA TYPE BIGINT,
ALTER COLUMN "item_site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "attribute_to_id" SET DATA TYPE BIGINT,
ALTER COLUMN "link_to_id" SET DATA TYPE BIGINT,
ALTER COLUMN "orig_item_site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "referrer_type_id" SET DATA TYPE BIGINT,
ALTER COLUMN "referrer_id" SET DATA TYPE BIGINT,
ALTER COLUMN "revenue_ledger_id" SET DATA TYPE BIGINT,
ALTER COLUMN "payment_type_id" SET DATA TYPE BIGINT,
ALTER COLUMN "commission_item_id" SET DATA TYPE BIGINT,
ALTER COLUMN "revenue_item_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."sites" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."snapshot_incomplete_exams" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "vendor_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "clinician_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "practice"."snapshot_provider_saturation" ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "site_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."client_facts" ALTER COLUMN "import_id" SET DATA TYPE BIGINT,
ALTER COLUMN "infusionsoft_id" SET DATA TYPE BIGINT,
ALTER COLUMN "title_id" SET DATA TYPE BIGINT,
ALTER COLUMN "home_site_id" SET DATA TYPE BIGINT,
ALTER COLUMN "employer_id" SET DATA TYPE BIGINT,
ALTER COLUMN "why_choose_us_id" SET DATA TYPE BIGINT,
ALTER COLUMN "referral_source_id" SET DATA TYPE BIGINT,
ALTER COLUMN "referred_by_id" SET DATA TYPE BIGINT,
ALTER COLUMN "medical_centre_id" SET DATA TYPE BIGINT,
ALTER COLUMN "gp_id" SET DATA TYPE BIGINT,
ALTER COLUMN "occupation_id" SET DATA TYPE BIGINT,
ALTER COLUMN "work_intensity_id" SET DATA TYPE BIGINT,
ALTER COLUMN "ethnic_group_id" SET DATA TYPE BIGINT,
ALTER COLUMN "unique_postal_address_ind" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "infusionsoft_forget_ind" SET DATA TYPE BIGINT,
ALTER COLUMN "drmg_org_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."performance" ALTER COLUMN "subject_sub_heading_id" SET DATA TYPE BIGINT,
ALTER COLUMN "owner_id" SET DATA TYPE BIGINT,
ALTER COLUMN "drmg_org_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."provider_facts" ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "drmg_org_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."treatment_analysis" ALTER COLUMN "owner_id" SET DATA TYPE BIGINT,
ALTER COLUMN "assessment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "discharged_outcome_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_referrer_id" SET DATA TYPE BIGINT,
ALTER COLUMN "condition_referrer_id" SET DATA TYPE BIGINT,
ALTER COLUMN "drmg_org_id" SET DATA TYPE BIGINT;

-- AlterTable
ALTER TABLE "warehouse"."treatment_goal_outcomes" ALTER COLUMN "assessment_id" SET DATA TYPE BIGINT,
ALTER COLUMN "owner_id" SET DATA TYPE BIGINT,
ALTER COLUMN "provider_id" SET DATA TYPE BIGINT,
ALTER COLUMN "client_id" SET DATA TYPE BIGINT,
ALTER COLUMN "goal_type_id" SET DATA TYPE BIGINT,
ALTER COLUMN "goal_timeframe_id" SET DATA TYPE BIGINT,
ALTER COLUMN "discharged_outcome_id" SET DATA TYPE BIGINT,
ALTER COLUMN "assessment_goal_id" SET DATA TYPE BIGINT;

-- AddForeignKey
ALTER TABLE "drmg"."clients_in_action_lists" ADD CONSTRAINT "clients_in_action_lists_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "practice"."clients"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."provider_facts" ADD CONSTRAINT "provider_facts_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_charges" ADD CONSTRAINT "appointment_charges_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_clients" ADD CONSTRAINT "appointment_clients_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "practice"."clients"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_clients" ADD CONSTRAINT "appointment_clients_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_conditions" ADD CONSTRAINT "appointment_conditions_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_conditions" ADD CONSTRAINT "appointment_conditions_condition_id_fkey" FOREIGN KEY ("condition_id") REFERENCES "practice"."conditions"("condition_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointments" ADD CONSTRAINT "appointments_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "practice"."clients"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointments" ADD CONSTRAINT "appointments_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."conditions" ADD CONSTRAINT "conditions_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."condition_injuries" ADD CONSTRAINT "condition_injuries_condition_id_fkey" FOREIGN KEY ("condition_id") REFERENCES "practice"."conditions"("condition_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."conditions_discharged" ADD CONSTRAINT "conditions_discharged_condition_id_fkey" FOREIGN KEY ("condition_id") REFERENCES "practice"."conditions"("condition_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."snapshot_incomplete_exams" ADD CONSTRAINT "snapshot_incomplete_exams_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "practice"."sites"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."snapshot_provider_saturation" ADD CONSTRAINT "snapshot_provider_saturation_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."snapshot_provider_saturation" ADD CONSTRAINT "snapshot_provider_saturation_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "practice"."sites"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;
