-- AlterTable
ALTER TABLE "warehouse"."treatment_analysis" ADD COLUMN     "client_referrer_id" INTEGER DEFAULT 0,
ADD COLUMN     "client_referrer_name" VARCHAR(255),
ADD COLUMN     "client_referrer_type" INTEGER,
ADD COLUMN     "condition_referrer_id" INTEGER DEFAULT 0,
ADD COLUMN     "condition_referrer_name" VARCHAR(255),
ADD COLUMN     "condition_referrer_type" INTEGER;
