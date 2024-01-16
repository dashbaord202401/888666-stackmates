/*
  Warnings:

  - You are about to drop the column `var_five` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_five_measure_date` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_five_measure_type` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_five_measure_type_name` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_four` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_four_measure_date` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_four_measure_type` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_four_measure_type_name` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_one` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_one_measure_date` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_one_measure_type_name` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_six` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_six_measure_date` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_six_measure_type` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_six_measure_type_name` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_three` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_three_measure_date` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_three_measure_type` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_three_measure_type_name` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_two` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_two_measure_date` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.
  - You are about to drop the column `var_two_measure_type_name` on the `conditions_discharged_outcomes` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "practice"."conditions_discharged_outcomes" DROP COLUMN "var_five",
DROP COLUMN "var_five_measure_date",
DROP COLUMN "var_five_measure_type",
DROP COLUMN "var_five_measure_type_name",
DROP COLUMN "var_four",
DROP COLUMN "var_four_measure_date",
DROP COLUMN "var_four_measure_type",
DROP COLUMN "var_four_measure_type_name",
DROP COLUMN "var_one",
DROP COLUMN "var_one_measure_date",
DROP COLUMN "var_one_measure_type_name",
DROP COLUMN "var_six",
DROP COLUMN "var_six_measure_date",
DROP COLUMN "var_six_measure_type",
DROP COLUMN "var_six_measure_type_name",
DROP COLUMN "var_three",
DROP COLUMN "var_three_measure_date",
DROP COLUMN "var_three_measure_type",
DROP COLUMN "var_three_measure_type_name",
DROP COLUMN "var_two",
DROP COLUMN "var_two_measure_date",
DROP COLUMN "var_two_measure_type_name",
ADD COLUMN     "val_five" INTEGER DEFAULT 0,
ADD COLUMN     "val_five_measure_date" DATE,
ADD COLUMN     "val_five_measure_type" VARCHAR(255),
ADD COLUMN     "val_five_measure_type_name" VARCHAR(255),
ADD COLUMN     "val_four" INTEGER DEFAULT 0,
ADD COLUMN     "val_four_measure_date" DATE,
ADD COLUMN     "val_four_measure_type" VARCHAR(255),
ADD COLUMN     "val_four_measure_type_name" VARCHAR(255),
ADD COLUMN     "val_one" INTEGER DEFAULT 0,
ADD COLUMN     "val_one_measure_date" DATE,
ADD COLUMN     "val_one_measure_type_name" VARCHAR(255),
ADD COLUMN     "val_six" INTEGER DEFAULT 0,
ADD COLUMN     "val_six_measure_date" DATE,
ADD COLUMN     "val_six_measure_type" VARCHAR(255),
ADD COLUMN     "val_six_measure_type_name" VARCHAR(255),
ADD COLUMN     "val_three" INTEGER DEFAULT 0,
ADD COLUMN     "val_three_measure_date" DATE,
ADD COLUMN     "val_three_measure_type" VARCHAR(255),
ADD COLUMN     "val_three_measure_type_name" VARCHAR(255),
ADD COLUMN     "val_two" INTEGER DEFAULT 0,
ADD COLUMN     "val_two_measure_date" DATE,
ADD COLUMN     "val_two_measure_type_name" VARCHAR(255);
