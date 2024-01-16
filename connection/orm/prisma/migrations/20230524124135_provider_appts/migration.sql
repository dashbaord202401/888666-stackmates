-- CreateTable
CREATE TABLE "practice"."provider_appointments" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT,
    "datetime_start" TIMESTAMP(6) NOT NULL,
    "datetime_end" TIMESTAMP(6) NOT NULL,
    "is_all_day" BOOLEAN NOT NULL DEFAULT false,
    "start_timezone" TEXT NOT NULL,
    "end_timezone" TEXT NOT NULL,
    "recurrence_rule" TEXT,
    "recurrence_exception" TEXT,
    "related_id" INTEGER NOT NULL,
    "recurrence_id" INTEGER NOT NULL,
    "room_id" INTEGER NOT NULL DEFAULT 0,
    "provider_id" INTEGER NOT NULL,
    "owner_id" INTEGER NOT NULL DEFAULT 0,
    "site_id" INTEGER NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "deleted" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "provider_appointments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."membership_usage" (
    "id" SERIAL NOT NULL,
    "appointment_type" INTEGER NOT NULL,
    "appointment_type_name" TEXT NOT NULL,
    "appointment_id" TEXT NOT NULL,
    "client_appointment_id" INTEGER NOT NULL,
    "appt_date_time" TIMESTAMP(6) NOT NULL,
    "client_membership_id" INTEGER NOT NULL,
    "membership_price_excl" DOUBLE PRECISION NOT NULL,
    "membership_price_incl" DOUBLE PRECISION NOT NULL,
    "site_id" INTEGER NOT NULL,
    "provider_id" INTEGER NOT NULL,
    "provider_name" VARCHAR(50) NOT NULL,
    "client_name" VARCHAR(100) NOT NULL,
    "membership_type_name" TEXT NOT NULL,
    "restricts_visits" INTEGER NOT NULL,
    "visits_allowed" BOOLEAN NOT NULL DEFAULT false,
    "units_used" INTEGER NOT NULL,
    "unitsValueExclTax" DOUBLE PRECISION NOT NULL,
    "units_value_incl_tax" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "membership_usage_pkey" PRIMARY KEY ("id")
);
