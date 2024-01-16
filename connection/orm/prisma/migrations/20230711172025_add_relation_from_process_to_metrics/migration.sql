-- AddForeignKey
ALTER TABLE "drmg"."business_function_metrics" ADD CONSTRAINT "business_function_metrics_procedure_measured_id_fkey" FOREIGN KEY ("procedure_measured_id") REFERENCES "drmg"."business_function_procedures"("id") ON DELETE SET NULL ON UPDATE CASCADE;
