-- CreateTable
CREATE TABLE "practice"."infusionsoft_clients_no_marketing" (
    "id" SERIAL NOT NULL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "date_of_birth" DATE,
    "email" VARCHAR(100),

    CONSTRAINT "infusionsoft_clients_no_marketing_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "infusionsoft_clients_no_marketing_last_name_email_idx" ON "practice"."infusionsoft_clients_no_marketing"("last_name", "email");
