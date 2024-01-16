/*
  Warnings:

  - A unique constraint covering the columns `[user_id]` on the table `clients` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "practice"."clients" ADD COLUMN     "user_id" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "clients_user_id_key" ON "practice"."clients"("user_id");

-- AddForeignKey
ALTER TABLE "practice"."clients" ADD CONSTRAINT "clients_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
