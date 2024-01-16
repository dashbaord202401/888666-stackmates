-- AlterTable
ALTER TABLE "drmg"."business_function_procedures" ADD COLUMN     "mindset" TEXT;

-- AlterTable
ALTER TABLE "practice"."provider_appointments" ADD COLUMN     "calc_hourly_rate" DECIMAL(65,30),
ADD COLUMN     "calc_hours_work" DECIMAL(65,30),
ADD COLUMN     "calc_work_cost" DECIMAL(65,30);

-- AlterTable
ALTER TABLE "practice"."system_users" ADD COLUMN     "annual_salary" DOUBLE PRECISION,
ADD COLUMN     "role" VARCHAR(100);

-- CreateTable
CREATE TABLE "drmg"."employee_rates" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "employee_rates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."business_role_rates" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "business_role_rates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."business_function_roles" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "business_function_id" INTEGER NOT NULL,
    "median_annual_salary" DOUBLE PRECISION,
    "median_hourly_salary" DOUBLE PRECISION,
    "high_annual_salary" DOUBLE PRECISION,
    "high_hourly_salary" DOUBLE PRECISION,

    CONSTRAINT "business_function_roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."business_admin_analysis" (
    "id" SERIAL NOT NULL,
    "report_start_date" DATE NOT NULL,
    "report_end_date" DATE NOT NULL,
    "report_period" VARCHAR(50) NOT NULL,
    "vendor_id" INTEGER NOT NULL,
    "site_id" INTEGER NOT NULL,
    "site_name" VARCHAR(50),
    "employee_id" INTEGER NOT NULL,
    "employee_name" VARCHAR(50),
    "business_function_id" INTEGER,
    "business_function_name" TEXT,
    "business_procedure_id" INTEGER,
    "business_procedure" TEXT,
    "labour_hours" DOUBLE PRECISION,
    "labour_cost" DOUBLE PRECISION,

    CONSTRAINT "business_admin_analysis_pkey" PRIMARY KEY ("id")
);
