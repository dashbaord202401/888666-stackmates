-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "practice";

-- CreateTable
CREATE TABLE "practice"."appointment_charges" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "deleted_ind" INTEGER NOT NULL,
    "appointment_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "organisation_id" INTEGER NOT NULL,
    "site_id" INTEGER NOT NULL,
    "provider_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "date_appt" TIMESTAMP(6) NOT NULL,
    "date_updated" TIMESTAMP(6),
    "appointment_status_indicator" INTEGER,
    "appointment_status_name" VARCHAR(200),
    "charge_type_id" INTEGER NOT NULL,
    "charge_type_name" VARCHAR(200),
    "charge_type_code" VARCHAR(200),
    "quantity" INTEGER,
    "client_amount" DECIMAL,
    "client_tax_amount" DECIMAL,
    "paid_by_amount" DECIMAL,
    "paid_by_tax_amount" DECIMAL,
    "paid_by_id" INTEGER,
    "invoiced_amount" DECIMAL,
    "invoiced_tax_amount" DECIMAL,
    "paid_by_invoiced_amount" DECIMAL,
    "paid_by_invoiced_tax_amount" DECIMAL,
    "initial_consultation_indicator" INTEGER,

    CONSTRAINT "appointment_charges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."appointment_clients" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "deleted_ind" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "organisation_id" INTEGER NOT NULL,
    "site_id" INTEGER NOT NULL,
    "site_name" VARCHAR(200),
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(200),
    "start_datetime" TIMESTAMP(6),
    "date_updated" TIMESTAMP(6),
    "client_id" INTEGER NOT NULL,
    "client_name" VARCHAR(200),
    "provider_duration" INTEGER,
    "appointment_status_indicator" INTEGER,
    "appointment_status_name" VARCHAR(200),
    "dna_cancelled_amount" DECIMAL,
    "dna_cancelled_tax_amount" DECIMAL,
    "charge_amount" DECIMAL,
    "charge_tax_amount" DECIMAL,
    "schedule_claim_amount" DECIMAL,
    "schedule_claim_tax_amount" DECIMAL,

    CONSTRAINT "appointment_clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."appointment_conditions" (
    "id" SERIAL NOT NULL,
    "appointment_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "condition_id" INTEGER NOT NULL,
    "condition_type" VARCHAR(200),
    "condition_type_name" VARCHAR(200),
    "start_date_time" TIMESTAMP(6) NOT NULL,
    "provider_duration" INTEGER,
    "client_charge" DECIMAL,
    "site_id" INTEGER,
    "site_name" VARCHAR(200),
    "provider_id" INTEGER,
    "provider_name" VARCHAR(200),
    "billing_code" VARCHAR(200),
    "appointment_status_indicator" VARCHAR(20),
    "appointment_status_name" VARCHAR(200),
    "is_epc_funded" INTEGER,
    "motor_vehicle_ind" INTEGER,
    "dva_number" VARCHAR(200),

    CONSTRAINT "appointment_conditions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."appointments" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "appointment_id" INTEGER NOT NULL,
    "start_datetime" TIMESTAMP(6),
    "durations" INTEGER,
    "client_id" INTEGER,
    "client_name" VARCHAR(200),
    "client_first_name" VARCHAR(200),
    "client_last_name" VARCHAR(200),
    "client_email" VARCHAR(200),
    "client_mobile" VARCHAR(200),
    "site_name" VARCHAR(200),
    "provider_id" INTEGER,
    "provider_name" VARCHAR(200),
    "provider_first_name" VARCHAR(200),
    "provider_last_name" VARCHAR(200),
    "provider_phone" VARCHAR(200),
    "provider_email" VARCHAR(200),
    "is_first_appointment" VARCHAR(3),

    CONSTRAINT "appointments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."charges" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "code" VARCHAR(100),
    "name" VARCHAR(100),
    "client_appointment_type" VARCHAR(100),
    "appointment_type" VARCHAR(100),
    "billing_type" VARCHAR(100),
    "date_from" DATE,
    "date_to" DATE,
    "client_display_name" VARCHAR(100),
    "default_invoice_notes" VARCHAR(100),
    "is_dex_charge" VARCHAR(3),
    "dex_show_total_cost_ind" INTEGER,
    "dex_show_quantity_ind" INTEGER,
    "dex_show_duration_ind" INTEGER,
    "discount_type" VARCHAR(100),
    "date_updated" DATE,
    "deleted_ind" INTEGER,
    "organisation_id" INTEGER,
    "debtor" VARCHAR(100),
    "fixed_rate" VARCHAR(100),
    "includes_tax_ind" VARCHAR(100),

    CONSTRAINT "charges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."infusionsoft_clients" (
    "id" SERIAL NOT NULL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "date_of_birth" DATE,
    "email" VARCHAR(100),

    CONSTRAINT "infusionsoft_clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."clients" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "infusionsoft_id" INTEGER NOT NULL,
    "date_created" TIMESTAMP(6) NOT NULL,
    "date_updated" TIMESTAMP(6) NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "organisation_id" INTEGER NOT NULL,
    "nhi_number" VARCHAR(50),
    "title_id" INTEGER,
    "title" VARCHAR(10),
    "sex" VARCHAR(1),
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "known_as" VARCHAR(100),
    "middle_name" VARCHAR(100),
    "maiden_name" VARCHAR(100),
    "date_of_birth" DATE,
    "phone" VARCHAR(100),
    "mobile" VARCHAR(100),
    "email" VARCHAR(100),
    "home_site_id" INTEGER,
    "home_site" VARCHAR(100),
    "home_address" VARCHAR(255),
    "work_address" VARCHAR(255),
    "postal_address" VARCHAR(255),
    "employer_id" INTEGER,
    "employer_name" VARCHAR(255),
    "employer_email" VARCHAR(255),
    "first_names" VARCHAR(255),
    "why_choose_us_id" INTEGER,
    "why_choose_us" VARCHAR(255),
    "referral_source_id" INTEGER,
    "referral_source" VARCHAR(255),
    "referred_by_type" VARCHAR(255),
    "referred_by_id" INTEGER,
    "medical_centre_id" INTEGER,
    "medical_centre" VARCHAR(255),
    "gp_id" INTEGER,
    "gp_name" VARCHAR(255),
    "occupation_id" INTEGER,
    "occupation_name" VARCHAR(255),
    "health_insurer" VARCHAR(255),
    "work_intensity_id" INTEGER,
    "work_intensity_name" VARCHAR(255),
    "ethnic_group_id" INTEGER,
    "ethnic_group_name" VARCHAR(255),
    "ethnic_group_other" VARCHAR(255),
    "home_address_street" VARCHAR(255),
    "home_address_suburb" VARCHAR(255),
    "home_address_city" VARCHAR(255),
    "home_address_state" VARCHAR(255),
    "home_address_postcode" VARCHAR(255),
    "home_address_country" VARCHAR(255),
    "unique_postal_address_ind" INTEGER,
    "postal_address_street" VARCHAR(255),
    "postal_address_suburb" VARCHAR(255),
    "postal_address_city" VARCHAR(255),
    "postal_address_state" VARCHAR(255),
    "postal_address_postcode" VARCHAR(255),
    "postal_address_country" VARCHAR(255),
    "inactive_ind" INTEGER,
    "deleted_ind" INTEGER,
    "include_in_mailouts" INTEGER,
    "date_of_death" DATE,
    "timestamp_update" TIMESTAMP(6) NOT NULL,
    "class_type_total" INTEGER,
    "class_types" VARCHAR(255),
    "conditions_problems" VARCHAR(255),
    "conditions_total" INTEGER,
    "contracts_total" INTEGER,
    "contracts_types" VARCHAR(255),
    "date_last_appt" DATE,
    "date_next_appt" DATE,
    "membership_status" TEXT,
    "membership_types" TEXT,
    "products_total" INTEGER,
    "products_types" VARCHAR(255),
    "cross_referral_total" INTEGER,
    "provider_last_appt" VARCHAR(255),
    "provider_next_appt" VARCHAR(255),

    CONSTRAINT "clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."clients_in_action_lists" (
    "id" SERIAL NOT NULL,
    "client_id" INTEGER NOT NULL,
    "report_name" VARCHAR(100) NOT NULL,
    "action_completed_ind" INTEGER,
    "actioned_by" INTEGER,
    "actioned_by_name" VARCHAR(100),
    "date_of_report" DATE NOT NULL,
    "date_report_from" DATE NOT NULL,
    "date_report_to" DATE NOT NULL,
    "date_actioned" TIMESTAMP(6),

    CONSTRAINT "clients_in_action_lists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."condition_injuries" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "condition_id" INTEGER NOT NULL,
    "organisation_id" INTEGER NOT NULL,
    "injury_type_id" INTEGER NOT NULL,
    "injury_type_name" VARCHAR(200),
    "side" VARCHAR(200),

    CONSTRAINT "condition_injuries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."conditions" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "condition_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "authorisation_site_id" INTEGER,
    "authorisation_site_name" VARCHAR(200),
    "condition_type" VARCHAR(200),
    "condition_type_name" VARCHAR(200),
    "is_epc_funded" VARCHAR(200),
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(200),
    "claim_no" VARCHAR(200),
    "referred_by_id" INTEGER,
    "referred_by_type" VARCHAR(200),
    "referred_by_type_name" VARCHAR(200),
    "external_id" VARCHAR(200),
    "client_id" INTEGER NOT NULL,
    "reference_no" VARCHAR(200),
    "date_created" DATE,
    "date_updated" DATE,
    "date_of_injury" DATE,
    "date_of_referral" DATE,
    "date_referral_expires" DATE,
    "motor_vehicle_ind" VARCHAR(200),
    "injury_description" VARCHAR(200),
    "cause_of_injury" VARCHAR(200),
    "work_intensity_id" INTEGER,
    "work_intensity_name" VARCHAR(200),

    CONSTRAINT "conditions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."conditions_discharged" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "organisation_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "client_title" VARCHAR(255),
    "client_first_name" VARCHAR(255),
    "client_known_as" VARCHAR(255),
    "client_last_name" VARCHAR(255),
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(255),
    "provider_type" VARCHAR(255),
    "provider_type_name" VARCHAR(255),
    "condition_id" INTEGER NOT NULL,
    "claim_number" VARCHAR(255),
    "read_code_list" VARCHAR(255),
    "total_appointments" INTEGER NOT NULL,
    "total_providers_seen" INTEGER NOT NULL,
    "discharged_ind" INTEGER NOT NULL,
    "discharge_summary" VARCHAR(255),
    "outcome_id" INTEGER NOT NULL,
    "outcome_type" VARCHAR(255),
    "outcome_details" VARCHAR(255),
    "date_of_injury" DATE,
    "date_first_appointment" DATE,
    "date_discharged" DATE,
    "date_for_followup" DATE,
    "date_followup_completed" DATE,

    CONSTRAINT "conditions_discharged_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."conditions_discharged_outcomes" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "created_by_id" INTEGER NOT NULL,
    "patient_assessment_id" INTEGER NOT NULL,
    "patient_assessment_owner_id" INTEGER NOT NULL,
    "patient_assessment_owner_type" VARCHAR(255),
    "provider_type" VARCHAR(255),
    "measure_type" VARCHAR(255),
    "measure_details" VARCHAR(255),
    "var_one" VARCHAR(255),
    "var_one_measure_date" DATE,
    "var_one_measure_type_name" VARCHAR(255),
    "var_two" VARCHAR(255),
    "var_two_measure_date" DATE,
    "var_two_measure_type_name" VARCHAR(255),
    "var_three" VARCHAR(255),
    "var_three_measure_date" DATE,
    "var_three_measure_type" VARCHAR(255),
    "var_three_measure_type_name" VARCHAR(255),
    "var_four" VARCHAR(255),
    "var_four_measure_date" DATE,
    "var_four_measure_type" VARCHAR(255),
    "var_four_measure_type_name" VARCHAR(255),
    "var_five" VARCHAR(255),
    "var_five_measure_date" DATE,
    "var_five_measure_type" VARCHAR(255),
    "var_five_measure_type_name" VARCHAR(255),
    "var_six" VARCHAR(255),
    "var_six_measure_date" DATE,
    "var_six_measure_type" VARCHAR(255),
    "var_six_measure_type_name" VARCHAR(255),
    "date_created" DATE,
    "date_updated" DATE,

    CONSTRAINT "conditions_discharged_outcomes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."providers" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "organisation_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "active_ind" INTEGER NOT NULL,
    "admin_only_ind" INTEGER NOT NULL,
    "external_id" VARCHAR(100),
    "provider_type_name" VARCHAR(100),
    "title" VARCHAR(100),
    "first_name" VARCHAR(100),
    "middle_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "code" VARCHAR(100),
    "system_user_id" INTEGER NOT NULL,
    "system_user_name" VARCHAR(100),
    "phone" VARCHAR(100),
    "mobile" VARCHAR(100),
    "email" VARCHAR(100),
    "address" VARCHAR(100),
    "contractor_ind" INTEGER,
    "external_ref" VARCHAR(100),
    "date_created" TIMESTAMP(6) NOT NULL,
    "date_updated" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "providers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."sites" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "external_reference" VARCHAR(100),
    "active_ind" INTEGER NOT NULL,
    "admin_only_ind" INTEGER NOT NULL,
    "date_updated" DATE,
    "name" VARCHAR(100),
    "trading_name" VARCHAR(100),
    "gst_number" VARCHAR(100),
    "phone" VARCHAR(100),
    "mobile" VARCHAR(100),
    "email" VARCHAR(100),
    "address" VARCHAR(100),
    "postal_address" VARCHAR(100),
    "timezone" VARCHAR(100),

    CONSTRAINT "sites_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."snapshot_incomplete_exams" (
    "id" SERIAL NOT NULL,
    "date_report_from" DATE,
    "date_report_to" DATE,
    "import_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "site_id" INTEGER NOT NULL,
    "clinician_id" INTEGER NOT NULL,
    "clinician_name" VARCHAR(100),
    "date_exam" DATE,
    "client_name" VARCHAR(100),
    "claim_no" VARCHAR(50),
    "condition_type" VARCHAR(50),
    "condition_type_name" VARCHAR(50),
    "status" VARCHAR(10),
    "has_exam" VARCHAR(5),

    CONSTRAINT "snapshot_incomplete_exams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."performance" (
    "id" SERIAL NOT NULL,
    "purpose" VARCHAR(50) NOT NULL,
    "date_year_starts" DATE NOT NULL,
    "analysis_type" VARCHAR(50),
    "site_name" VARCHAR(255),
    "subject_heading" VARCHAR(255),
    "subject_ledger" VARCHAR(255),
    "subject_sub_heading" VARCHAR(255),
    "subject_sub_heading_type" VARCHAR(255),
    "subject_sub_heading_ledger" VARCHAR(255),
    "subject_sub_heading_id" INTEGER,
    "week_01_value" DOUBLE PRECISION,
    "week_02_value" DOUBLE PRECISION,
    "week_03_value" DOUBLE PRECISION,
    "week_04_value" DOUBLE PRECISION,
    "week_05_value" DOUBLE PRECISION,
    "week_06_value" DOUBLE PRECISION,
    "week_07_value" DOUBLE PRECISION,
    "week_08_value" DOUBLE PRECISION,
    "week_09_value" DOUBLE PRECISION,
    "week_10_value" DOUBLE PRECISION,
    "week_11_value" DOUBLE PRECISION,
    "week_12_value" DOUBLE PRECISION,
    "week_13_value" DOUBLE PRECISION,
    "week_14_value" DOUBLE PRECISION,
    "week_15_value" DOUBLE PRECISION,
    "week_16_value" DOUBLE PRECISION,
    "week_17_value" DOUBLE PRECISION,
    "week_18_value" DOUBLE PRECISION,
    "week_19_value" DOUBLE PRECISION,
    "week_20_value" DOUBLE PRECISION,
    "week_21_value" DOUBLE PRECISION,
    "week_22_value" DOUBLE PRECISION,
    "week_23_value" DOUBLE PRECISION,
    "week_24_value" DOUBLE PRECISION,
    "week_25_value" DOUBLE PRECISION,
    "week_26_value" DOUBLE PRECISION,
    "week_27_value" DOUBLE PRECISION,
    "week_28_value" DOUBLE PRECISION,
    "week_29_value" DOUBLE PRECISION,
    "week_30_value" DOUBLE PRECISION,
    "week_31_value" DOUBLE PRECISION,
    "week_32_value" DOUBLE PRECISION,
    "week_33_value" DOUBLE PRECISION,
    "week_34_value" DOUBLE PRECISION,
    "week_35_value" DOUBLE PRECISION,
    "week_36_value" DOUBLE PRECISION,
    "week_37_value" DOUBLE PRECISION,
    "week_38_value" DOUBLE PRECISION,
    "week_39_value" DOUBLE PRECISION,
    "week_40_value" DOUBLE PRECISION,
    "week_41_value" DOUBLE PRECISION,
    "week_42_value" DOUBLE PRECISION,
    "week_43_value" DOUBLE PRECISION,
    "week_44_value" DOUBLE PRECISION,
    "week_45_value" DOUBLE PRECISION,
    "week_46_value" DOUBLE PRECISION,
    "week_47_value" DOUBLE PRECISION,
    "week_48_value" DOUBLE PRECISION,
    "week_49_value" DOUBLE PRECISION,
    "week_50_value" DOUBLE PRECISION,
    "week_51_value" DOUBLE PRECISION,
    "week_52_value" DOUBLE PRECISION,
    "owner_id" INTEGER,
    "owner_name" VARCHAR(25),
    "date_created" TIMESTAMP(6) NOT NULL,
    "date_updated" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "performance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."snapshot_revenue_items" (
    "id" SERIAL NOT NULL,
    "report_period" VARCHAR(20),
    "date_report_from" DATE,
    "date_report_to" DATE,
    "item_id" INTEGER NOT NULL,
    "item_type" VARCHAR(50),
    "item_type_name" VARCHAR(50),
    "item_details" VARCHAR(255),
    "debtor_name" VARCHAR(255),
    "product_group_name" VARCHAR(255),
    "other_details" VARCHAR(255),
    "item_site_id" INTEGER,
    "site_id" INTEGER,
    "site_name" VARCHAR(255),
    "parent_site_name" VARCHAR(255),
    "vendor_id" INTEGER NOT NULL,
    "attribute_to_name" VARCHAR(255),
    "attribute_to_id" INTEGER,
    "item_date" DATE,
    "quantity" INTEGER,
    "amount" INTEGER,
    "tax_amount" DOUBLE PRECISION,
    "total_amount" DOUBLE PRECISION,
    "debtor_id" INTEGER,
    "related_id" INTEGER,
    "link_to_id" INTEGER,
    "link_to_type" VARCHAR(50),
    "orig_item_site_id" INTEGER,
    "date_paid" DATE,
    "pmt_item_id" INTEGER,
    "pmt_item_type" VARCHAR(50),
    "referrer_type_id" INTEGER,
    "referrer_id" INTEGER,
    "referrer_name" VARCHAR(255),
    "invoice_no" VARCHAR(255),
    "revenue_ledger_id" INTEGER,
    "payment_type_id" INTEGER,
    "payment_type_name" VARCHAR(255),
    "direct_deposit_ind" INTEGER,
    "commission_item_id" INTEGER,
    "commission_item_type" VARCHAR(50),
    "revenue_item_id" INTEGER,

    CONSTRAINT "snapshot_revenue_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."snapshot_provider_revenue" (
    "id" SERIAL NOT NULL,
    "report_period" VARCHAR(20),
    "date_report_from" DATE,
    "date_report_to" DATE,
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(255),
    "appt_charge_rev" DECIMAL,
    "contract_rev" DECIMAL,
    "product_rev" DECIMAL,
    "client_charge_rev" DECIMAL,
    "dna_cancel_rev" DECIMAL,
    "insurer_schedule_rev" DECIMAL,
    "acc_schedule_rev" DECIMAL,
    "rejected" DECIMAL,
    "adjusted" DECIMAL,

    CONSTRAINT "snapshot_provider_revenue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."snapshot_provider_saturation" (
    "id" SERIAL NOT NULL,
    "report_period" VARCHAR(20),
    "date_report_from" DATE,
    "date_report_to" DATE,
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(200),
    "site_id" INTEGER NOT NULL,
    "site_name" VARCHAR(200),
    "site_availability_dur" DECIMAL,
    "no_show_dur" DECIMAL,
    "no_show_count" DECIMAL,
    "in_service_dur" DECIMAL,
    "in_service_count" DECIMAL,
    "prv_dur" DECIMAL,
    "prv_count" DECIMAL,
    "client_dur" DECIMAL,
    "client_count" DECIMAL,
    "class_dur" DECIMAL,
    "class_count" DECIMAL,
    "total_count" DECIMAL,

    CONSTRAINT "snapshot_provider_saturation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "infusionsoft_clients_last_name_email_idx" ON "practice"."infusionsoft_clients"("last_name", "email");

-- CreateIndex
CREATE INDEX "clients_last_name_idx" ON "practice"."clients"("last_name");

-- CreateIndex
CREATE INDEX "clients_email_idx" ON "practice"."clients"("email");

-- CreateIndex
CREATE UNIQUE INDEX "performance_purpose_date_year_starts_analysis_type_site_nam_key" ON "practice"."performance"("purpose", "date_year_starts", "analysis_type", "site_name", "subject_heading", "subject_sub_heading");
