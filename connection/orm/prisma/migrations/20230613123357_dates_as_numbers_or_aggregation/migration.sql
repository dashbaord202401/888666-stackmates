-- AlterTable
ALTER TABLE "warehouse"."client_facts" ADD COLUMN     "month_created" INTEGER DEFAULT 0,
ADD COLUMN     "week_created" INTEGER DEFAULT 0,
ADD COLUMN     "year_created" INTEGER DEFAULT 0;
