-- AddForeignKey
ALTER TABLE "practice"."provider_performance" ADD CONSTRAINT "provider_performance_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;
