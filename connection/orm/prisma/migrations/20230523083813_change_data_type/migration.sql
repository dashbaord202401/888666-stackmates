/*
  Warnings:

  - Added the required column `item_type` to the `revenue_items` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "practice"."revenue_items" DROP COLUMN "item_type",
ADD COLUMN     "item_type" INTEGER NOT NULL;
