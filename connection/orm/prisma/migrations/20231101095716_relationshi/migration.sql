-- AddForeignKey
ALTER TABLE "ecommerce"."invoices" ADD CONSTRAINT "invoices_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "ecommerce"."customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
