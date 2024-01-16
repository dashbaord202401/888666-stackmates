/*
  Warnings:

  - You are about to drop the column `all_goals_achieved_ind` on the `treatment_analysis` table. All the data in the column will be lost.
  - You are about to drop the column `success_support_hours` on the `treatment_analysis` table. All the data in the column will be lost.
  - You are about to drop the column `support_email_impressions` on the `treatment_analysis` table. All the data in the column will be lost.
  - You are about to drop the column `support_msg_impressions` on the `treatment_analysis` table. All the data in the column will be lost.
  - You are about to drop the column `support_phone_impressions` on the `treatment_analysis` table. All the data in the column will be lost.
  - You are about to drop the column `support_social_media_impressions` on the `treatment_analysis` table. All the data in the column will be lost.
  - You are about to drop the column `support_treatment_cost` on the `treatment_analysis` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "warehouse"."treatment_analysis" DROP COLUMN "all_goals_achieved_ind",
DROP COLUMN "success_support_hours",
DROP COLUMN "support_email_impressions",
DROP COLUMN "support_msg_impressions",
DROP COLUMN "support_phone_impressions",
DROP COLUMN "support_social_media_impressions",
DROP COLUMN "support_treatment_cost",
ADD COLUMN     "customer_support_cost" DOUBLE PRECISION DEFAULT 0,
ADD COLUMN     "customer_support_hours" DOUBLE PRECISION DEFAULT 0,
ADD COLUMN     "impressions_email" INTEGER DEFAULT 0,
ADD COLUMN     "impressions_message" INTEGER DEFAULT 0,
ADD COLUMN     "impressions_phone" INTEGER DEFAULT 0,
ADD COLUMN     "impressions_social_media" INTEGER DEFAULT 0,
ADD COLUMN     "total_goals_achieved" INTEGER DEFAULT 0;
