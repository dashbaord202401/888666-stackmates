-- CreateTable
CREATE TABLE "practice"."gensolve_meta_types" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "import_id" INTEGER NOT NULL,
    "deleted_ind" INTEGER NOT NULL DEFAULT 0,
    "active_ind" INTEGER NOT NULL DEFAULT 0,
    "date_updated" TIMESTAMP(6),
    "type_id" INTEGER NOT NULL,

    CONSTRAINT "gensolve_meta_types_pkey" PRIMARY KEY ("id")
);
