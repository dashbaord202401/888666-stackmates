-- AlterTable
ALTER TABLE "practice"."business_events" ADD COLUMN     "business_procedure_id" INTEGER,
ADD COLUMN     "parsed_function_name" TEXT,
ADD COLUMN     "system_user_id" INTEGER;

-- AlterTable
ALTER TABLE "practice"."provider_appointments" ADD COLUMN     "business_procedure_id" INTEGER;
