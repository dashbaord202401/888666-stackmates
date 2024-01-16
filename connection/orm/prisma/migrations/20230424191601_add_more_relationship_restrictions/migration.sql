/*
  Warnings:

  - A unique constraint covering the columns `[import_id]` on the table `sites` will be added. If there are existing duplicate values, this will fail.
  - Made the column `provider_id` on table `appointment_conditions` required. This step will fail if there are existing NULL values in that column.
  - Made the column `provider_id` on table `appointments` required. This step will fail if there are existing NULL values in that column.
  - Made the column `site_id` on table `snapshot_revenue_items` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "practice"."appointment_conditions" ALTER COLUMN "provider_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "practice"."appointments" ALTER COLUMN "provider_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "practice"."snapshot_revenue_items" ALTER COLUMN "site_id" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "sites_import_id_key" ON "practice"."sites"("import_id");

-- AddForeignKey
ALTER TABLE "practice"."appointment_charges" ADD CONSTRAINT "appointment_charges_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_clients" ADD CONSTRAINT "appointment_clients_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "practice"."clients"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_clients" ADD CONSTRAINT "appointment_clients_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_conditions" ADD CONSTRAINT "appointment_conditions_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointment_conditions" ADD CONSTRAINT "appointment_conditions_condition_id_fkey" FOREIGN KEY ("condition_id") REFERENCES "practice"."conditions"("condition_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."appointments" ADD CONSTRAINT "appointments_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."snapshot_incomplete_exams" ADD CONSTRAINT "snapshot_incomplete_exams_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "practice"."sites"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."snapshot_revenue_items" ADD CONSTRAINT "snapshot_revenue_items_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "practice"."sites"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;
