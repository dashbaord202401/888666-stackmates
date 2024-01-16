/*
  Warnings:

  - You are about to drop the `snapshot_revenue_items` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "practice"."snapshot_revenue_items" DROP CONSTRAINT "snapshot_revenue_items_site_id_fkey";

-- DropTable
DROP TABLE "practice"."snapshot_revenue_items";

-- CreateTable
CREATE TABLE "practice"."revenue_items" (
    "id" SERIAL NOT NULL,
    "item_id" INTEGER NOT NULL,
    "item_type" VARCHAR(50),
    "item_type_name" VARCHAR(50),
    "item_details" VARCHAR(255),
    "debtor_id" INTEGER,
    "related_id" INTEGER,
    "debtor_name" VARCHAR(255),
    "other_details" VARCHAR(255),
    "product_group_name" VARCHAR(255),
    "item_site_id" INTEGER,
    "site_id" INTEGER NOT NULL,
    "site_name" VARCHAR(255),
    "parent_site_name" VARCHAR(255),
    "vendor_id" INTEGER NOT NULL,
    "attribute_to_name" VARCHAR(255),
    "attribute_to_id" INTEGER,
    "item_date" DATE,
    "quantity" INTEGER,
    "amount" DOUBLE PRECISION,
    "tax_amount" DOUBLE PRECISION,
    "total_amount" DOUBLE PRECISION,
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
    "utc_date_report_from" TIMESTAMP(6),
    "utc_date_report_to" TIMESTAMP(6),

    CONSTRAINT "revenue_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."client_revenue_summary" (
    "id" SERIAL NOT NULL,
    "report_period" VARCHAR(20),
    "period_number" INTEGER,
    "date_report_from" DATE,
    "date_report_to" DATE,
    "vendor_id" INTEGER NOT NULL,
    "debtor_id" INTEGER,
    "debtor_name" VARCHAR(255),
    "other_details" VARCHAR(255),
    "related_id" INTEGER,
    "client_id" INTEGER,
    "item_type" VARCHAR(50),
    "item_type_name" VARCHAR(50),
    "product_group_name" VARCHAR(255),
    "revenue_ledger_id" INTEGER,
    "count_quantity" INTEGER,
    "sum_amount" DOUBLE PRECISION,
    "sum_tax_amount" DOUBLE PRECISION,
    "sum_total_amount" DOUBLE PRECISION,

    CONSTRAINT "client_revenue_summary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."business_trade_partner" (
    "debtor_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,

    CONSTRAINT "business_trade_partner_pkey" PRIMARY KEY ("debtor_id","client_id")
);
