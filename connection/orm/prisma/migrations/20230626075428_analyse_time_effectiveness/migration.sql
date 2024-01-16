-- AlterTable
ALTER TABLE "practice"."business_events" ADD COLUMN     "date_parsed" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "practice"."provider_appointments" ADD COLUMN     "business_function_id" INTEGER,
ADD COLUMN     "business_function_name" TEXT,
ADD COLUMN     "date_parsed" TIMESTAMP(3),
ADD COLUMN     "mindset_name" TEXT,
ADD COLUMN     "process_type" TEXT;
