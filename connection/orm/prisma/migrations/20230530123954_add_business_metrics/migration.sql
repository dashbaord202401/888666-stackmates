/*
  Warnings:

  - Added the required column `business_function_id` to the `business_function_procedures` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "drmg"."business_function_procedures" ADD COLUMN     "business_function_id" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "drmg"."business_function_metrics" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "industry" TEXT,
    "business_function_id" INTEGER NOT NULL,

    CONSTRAINT "business_function_metrics_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "business_function_metrics_name_key" ON "drmg"."business_function_metrics"("name");

-- AddForeignKey
ALTER TABLE "drmg"."business_function_procedures" ADD CONSTRAINT "business_function_procedures_business_function_id_fkey" FOREIGN KEY ("business_function_id") REFERENCES "drmg"."business_functions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_function_metrics" ADD CONSTRAINT "business_function_metrics_business_function_id_fkey" FOREIGN KEY ("business_function_id") REFERENCES "drmg"."business_functions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
