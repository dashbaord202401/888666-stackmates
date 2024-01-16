/*
  Warnings:

  - Added the required column `country` to the `business_org` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "drmg"."business_org" ADD COLUMN     "country" TEXT NOT NULL,
ALTER COLUMN "addressOne" DROP NOT NULL,
ALTER COLUMN "addressTwo" DROP NOT NULL,
ALTER COLUMN "postCode" DROP NOT NULL;

-- AlterTable
ALTER TABLE "drmg"."expense_payment" ALTER COLUMN "description" DROP NOT NULL;
