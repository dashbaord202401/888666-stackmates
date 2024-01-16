-- AlterTable
ALTER TABLE "warehouse"."client_facts" ADD COLUMN     "infusionsoft_confirm_ind" INTEGER DEFAULT 0,
ADD COLUMN     "social_linkedin" VARCHAR(255),
ADD COLUMN     "social_tiktok" VARCHAR(255);
