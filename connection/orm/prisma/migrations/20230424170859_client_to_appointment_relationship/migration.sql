/*
  Warnings:

  - Made the column `client_id` on table `appointments` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "practice"."appointments" ALTER COLUMN "client_id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "practice"."appointments" ADD CONSTRAINT "appointments_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "practice"."clients"("import_id") ON DELETE RESTRICT ON UPDATE CASCADE;
