-- CreateTable
CREATE TABLE "practice"."provider_performance" (
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

    CONSTRAINT "provider_performance_pkey" PRIMARY KEY ("id")
);
