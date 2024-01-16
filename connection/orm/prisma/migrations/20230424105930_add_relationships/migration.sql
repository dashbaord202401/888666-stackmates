/*
  Warnings:

  - A unique constraint covering the columns `[import_id]` on the table `clients` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[import_id]` on the table `providers` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "clients_import_id_key" ON "practice"."clients"("import_id");

-- CreateIndex
CREATE UNIQUE INDEX "providers_import_id_key" ON "practice"."providers"("import_id");

-- AddForeignKey
ALTER TABLE "practice"."clients_in_action_lists" ADD CONSTRAINT "clients_in_action_lists_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "practice"."clients"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "practice"."conditions" ADD CONSTRAINT "conditions_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "practice"."providers"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;
