/*
  Warnings:

  - You are about to drop the `clients_in_action_lists` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `provider_performance` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "practice"."clients_in_action_lists" DROP CONSTRAINT "clients_in_action_lists_client_id_fkey";

-- DropForeignKey
ALTER TABLE "practice"."provider_performance" DROP CONSTRAINT "provider_performance_provider_id_fkey";

-- DropTable
DROP TABLE "practice"."clients_in_action_lists";

-- DropTable
DROP TABLE "practice"."provider_performance";

-- CreateTable
CREATE TABLE "drmg"."clients_in_action_lists" (
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
CREATE TABLE "warehouse"."provider_facts" (
    "id" SERIAL NOT NULL,
    "report_period" VARCHAR(20),
    "period_number" INTEGER,
    "date_report_from" DATE,
    "date_report_to" DATE,
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(200),
    "no_show_dur" DECIMAL DEFAULT 0,
    "no_show_count" INTEGER DEFAULT 0,
    "in_service_dur" DECIMAL DEFAULT 0,
    "in_service_count" INTEGER DEFAULT 0,
    "prv_dur" DECIMAL DEFAULT 0,
    "prv_count" INTEGER DEFAULT 0,
    "client_dur" DECIMAL DEFAULT 0,
    "client_count" INTEGER DEFAULT 0,
    "class_dur" DECIMAL DEFAULT 0,
    "class_count" INTEGER DEFAULT 0,
    "total_count" INTEGER DEFAULT 0,
    "acc_schedule_rev" DOUBLE PRECISION DEFAULT 0,
    "adjusted" DOUBLE PRECISION DEFAULT 0,
    "appt_charge_rev" DOUBLE PRECISION DEFAULT 0,
    "client_charge_rev" DOUBLE PRECISION DEFAULT 0,
    "contract_rev" DOUBLE PRECISION DEFAULT 0,
    "insurer_schedule_rev" DOUBLE PRECISION DEFAULT 0,
    "product_rev" DOUBLE PRECISION DEFAULT 0,
    "rejected" DOUBLE PRECISION DEFAULT 0,
    "unique_client_count" INTEGER DEFAULT 0,
    "dna_cancel_rev" DOUBLE PRECISION DEFAULT 0,
    "available_dur" DECIMAL DEFAULT 0,
    "utc_date_report_from" TIMESTAMP(6),
    "utc_date_report_to" TIMESTAMP(6),

    CONSTRAINT "provider_facts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."client_facts" (
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
    "employer_id" INTEGER DEFAULT -1,
    "employer_name" VARCHAR(255) DEFAULT 'Unknown',
    "employer_email" VARCHAR(255),
    "first_names" VARCHAR(255),
    "why_choose_us_id" INTEGER DEFAULT -1,
    "why_choose_us" VARCHAR(255) DEFAULT 'Unknown',
    "referral_source_id" INTEGER DEFAULT -1,
    "referral_source" VARCHAR(255) DEFAULT 'Unknown',
    "referred_by_type" VARCHAR(255) DEFAULT 'Unknown',
    "referred_by_id" INTEGER DEFAULT -1,
    "medical_centre_id" INTEGER DEFAULT -1,
    "medical_centre" VARCHAR(255) DEFAULT 'Unknown',
    "gp_id" INTEGER DEFAULT -1,
    "gp_name" VARCHAR(255) DEFAULT 'Unknown',
    "occupation_id" INTEGER DEFAULT -1,
    "occupation_name" VARCHAR(255) DEFAULT 'Unknown',
    "health_insurer" VARCHAR(255) DEFAULT 'Unknown',
    "work_intensity_id" INTEGER DEFAULT -1,
    "work_intensity_name" VARCHAR(255) DEFAULT 'Unknown',
    "ethnic_group_id" INTEGER DEFAULT -1,
    "ethnic_group_name" VARCHAR(255) DEFAULT 'Unknown',
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
    "user_id" TEXT,

    CONSTRAINT "client_facts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "client_facts_import_id_key" ON "warehouse"."client_facts"("import_id");

-- CreateIndex
CREATE UNIQUE INDEX "client_facts_user_id_key" ON "warehouse"."client_facts"("user_id");

-- CreateIndex
CREATE INDEX "client_facts_last_name_idx" ON "warehouse"."client_facts"("last_name");

-- CreateIndex
CREATE INDEX "client_facts_email_idx" ON "warehouse"."client_facts"("email");

-- AddForeignKey
ALTER TABLE "drmg"."clients_in_action_lists" ADD CONSTRAINT "clients_in_action_lists_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "practice"."clients"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."provider_facts" ADD CONSTRAINT "provider_facts_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;
