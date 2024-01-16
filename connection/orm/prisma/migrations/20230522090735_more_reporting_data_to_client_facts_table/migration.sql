-- AlterTable
ALTER TABLE "warehouse"."client_facts" ADD COLUMN     "cancelled_total" INTEGER,
ADD COLUMN     "date_last_cancel" DATE,
ADD COLUMN     "date_last_condition_discharged" DATE,
ADD COLUMN     "date_last_condition_started" DATE,
ADD COLUMN     "date_last_no_show" DATE,
ADD COLUMN     "no_show_total" INTEGER,
ADD COLUMN     "past_ninety_day_spend" DOUBLE PRECISION DEFAULT 0;
