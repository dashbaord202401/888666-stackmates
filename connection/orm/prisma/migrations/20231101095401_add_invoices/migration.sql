-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "ecommerce";

-- CreateTable
CREATE TABLE "ecommerce"."invoices" (
    "id" TEXT NOT NULL,
    "customer_id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "status" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "invoices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ecommerce"."customers" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "customers_email_key" ON "ecommerce"."customers"("email");
