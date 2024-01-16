-- AlterTable
ALTER TABLE "warehouse"."treatment_analysis" ADD COLUMN     "con_date_created" DATE;

-- AddForeignKey
ALTER TABLE "practice"."snapshot_provider_saturation" ADD CONSTRAINT "snapshot_provider_saturation_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."snapshot_provider_saturation" ADD CONSTRAINT "snapshot_provider_saturation_site_id_fkey" FOREIGN KEY ("site_id") REFERENCES "practice"."sites"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;
