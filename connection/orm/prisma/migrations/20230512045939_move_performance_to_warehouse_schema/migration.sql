/*
  Warnings:

  - You are about to drop the `performance` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "practice"."performance";

-- CreateTable
CREATE TABLE "warehouse"."performance" (
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
    "date_created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "date_updated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "performance_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "performance_purpose_date_year_starts_analysis_type_site_nam_key" ON "warehouse"."performance"("purpose", "date_year_starts", "analysis_type", "site_name", "subject_heading", "subject_sub_heading");
