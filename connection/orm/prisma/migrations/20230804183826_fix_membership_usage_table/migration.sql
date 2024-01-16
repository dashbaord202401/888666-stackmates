/*
  Warnings:

  - You are about to drop the column `unitsValueExclTax` on the `membership_usage` table. All the data in the column will be lost.
  - You are about to alter the column `membership_type_name` on the `membership_usage` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(100)`.
  - The `restricts_visits` column on the `membership_usage` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `visits_allowed` column on the `membership_usage` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `appointment_id` on the `membership_usage` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "practice"."membership_usage" DROP COLUMN "unitsValueExclTax",
ADD COLUMN     "units_value_excl_tax" DOUBLE PRECISION,
DROP COLUMN "appointment_id",
ADD COLUMN     "appointment_id" INTEGER NOT NULL,
ALTER COLUMN "membership_price_excl" DROP NOT NULL,
ALTER COLUMN "membership_price_incl" DROP NOT NULL,
ALTER COLUMN "membership_type_name" SET DATA TYPE VARCHAR(100),
DROP COLUMN "restricts_visits",
ADD COLUMN     "restricts_visits" BOOLEAN NOT NULL DEFAULT false,
DROP COLUMN "visits_allowed",
ADD COLUMN     "visits_allowed" INTEGER,
ALTER COLUMN "units_used" DROP NOT NULL,
ALTER COLUMN "units_value_incl_tax" DROP NOT NULL;
