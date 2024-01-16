-- AlterTable
ALTER TABLE "practice"."snapshot_provider_saturation" ADD COLUMN     "billed_saturation" DECIMAL,
ADD COLUMN     "business_saturation" DECIMAL,
ADD COLUMN     "clinical_saturation" DECIMAL,
ADD COLUMN     "reprocess_data_ind" INTEGER DEFAULT 0;
