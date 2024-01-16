-- AlterTable
ALTER TABLE "drmg"."business_functions" ADD COLUMN     "is_core_function" INTEGER DEFAULT 0;

-- CreateTable
CREATE TABLE "drmg"."business_function_procedures" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "industry" TEXT,
    "ai_agent" TEXT,
    "ai_agent_rating" INTEGER DEFAULT 0,

    CONSTRAINT "business_function_procedures_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."software_product_types" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "software_product_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."software_products" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "ai_rating" INTEGER NOT NULL DEFAULT 0,
    "blockchain_rating" INTEGER NOT NULL DEFAULT 0,
    "api_rating" INTEGER NOT NULL DEFAULT 0,
    "api_integrations" INTEGER NOT NULL DEFAULT 0,
    "notes" TEXT,
    "product_type_id" INTEGER,

    CONSTRAINT "software_products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."software_functions" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "software_functions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."product_software_functions" (
    "id" SERIAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    "software_function_id" INTEGER NOT NULL,

    CONSTRAINT "product_software_functions_pkey" PRIMARY KEY ("product_id","software_function_id")
);

-- CreateTable
CREATE TABLE "drmg"."software_api_integrations" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "software_api_integrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."product_software_integrations" (
    "id" SERIAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    "software_integration_id" INTEGER NOT NULL,

    CONSTRAINT "product_software_integrations_pkey" PRIMARY KEY ("product_id","software_integration_id")
);

-- CreateTable
CREATE TABLE "drmg"."software_engineering_functions" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "software_engineering_functions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."software_engineering_procedures" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "software_engineering_function_id" INTEGER NOT NULL,
    "ai_agent" TEXT,
    "ai_agent_rating" INTEGER DEFAULT 0,

    CONSTRAINT "software_engineering_procedures_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "business_function_procedures_name_key" ON "drmg"."business_function_procedures"("name");

-- CreateIndex
CREATE UNIQUE INDEX "software_product_types_name_key" ON "drmg"."software_product_types"("name");

-- CreateIndex
CREATE UNIQUE INDEX "software_products_name_key" ON "drmg"."software_products"("name");

-- CreateIndex
CREATE UNIQUE INDEX "software_functions_name_key" ON "drmg"."software_functions"("name");

-- CreateIndex
CREATE UNIQUE INDEX "software_api_integrations_name_key" ON "drmg"."software_api_integrations"("name");

-- CreateIndex
CREATE UNIQUE INDEX "software_engineering_functions_name_key" ON "drmg"."software_engineering_functions"("name");

-- CreateIndex
CREATE UNIQUE INDEX "software_engineering_procedures_name_key" ON "drmg"."software_engineering_procedures"("name");

-- AddForeignKey
ALTER TABLE "drmg"."software_products" ADD CONSTRAINT "software_products_product_type_id_fkey" FOREIGN KEY ("product_type_id") REFERENCES "drmg"."software_product_types"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."product_software_functions" ADD CONSTRAINT "product_software_functions_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "drmg"."software_products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."product_software_functions" ADD CONSTRAINT "product_software_functions_software_function_id_fkey" FOREIGN KEY ("software_function_id") REFERENCES "drmg"."software_functions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."product_software_integrations" ADD CONSTRAINT "product_software_integrations_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "drmg"."software_products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."product_software_integrations" ADD CONSTRAINT "product_software_integrations_software_integration_id_fkey" FOREIGN KEY ("software_integration_id") REFERENCES "drmg"."software_api_integrations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."software_engineering_procedures" ADD CONSTRAINT "software_engineering_procedures_software_engineering_funct_fkey" FOREIGN KEY ("software_engineering_function_id") REFERENCES "drmg"."software_engineering_functions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
