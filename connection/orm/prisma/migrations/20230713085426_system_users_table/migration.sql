-- CreateTable
CREATE TABLE "practice"."system_users" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "organisation_id" INTEGER NOT NULL,
    "user_name" VARCHAR(100) NOT NULL,
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "active_ind" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "system_users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "system_users_import_id_key" ON "practice"."system_users"("import_id");
