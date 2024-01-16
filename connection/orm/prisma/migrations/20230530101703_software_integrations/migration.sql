/*
  Warnings:

  - You are about to drop the `product_software_integrations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `software_api_integrations` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "drmg"."product_software_integrations" DROP CONSTRAINT "product_software_integrations_product_id_fkey";

-- DropForeignKey
ALTER TABLE "drmg"."product_software_integrations" DROP CONSTRAINT "product_software_integrations_software_integration_id_fkey";

-- DropTable
DROP TABLE "drmg"."product_software_integrations";

-- DropTable
DROP TABLE "drmg"."software_api_integrations";

-- CreateTable
CREATE TABLE "drmg"."software_integrations" (
    "id" SERIAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    "integrated_product_id" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL DEFAULT 0,
    "notes" TEXT,

    CONSTRAINT "software_integrations_pkey" PRIMARY KEY ("product_id","integrated_product_id")
);

-- AddForeignKey
ALTER TABLE "drmg"."software_integrations" ADD CONSTRAINT "software_integrations_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "drmg"."software_products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."software_integrations" ADD CONSTRAINT "software_integrations_integrated_product_id_fkey" FOREIGN KEY ("integrated_product_id") REFERENCES "drmg"."software_products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
