/*
  Warnings:

  - Added the required column `updated_at` to the `business_function_procedures` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "drmg"."business_function_metrics" ADD COLUMN     "measure_type" TEXT;

-- AlterTable
ALTER TABLE "drmg"."business_function_procedures" ADD COLUMN     "action_schedule" TEXT,
ADD COLUMN     "action_trigger" TEXT,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_user_id" TEXT,
ADD COLUMN     "dependencies" TEXT,
ADD COLUMN     "essential_ind" INTEGER DEFAULT 0,
ADD COLUMN     "industry_specific_ind" INTEGER DEFAULT 0,
ADD COLUMN     "inputs" TEXT,
ADD COLUMN     "meta_changelog" TEXT,
ADD COLUMN     "meta_comments" TEXT,
ADD COLUMN     "meta_status" TEXT DEFAULT 'draft',
ADD COLUMN     "meta_version" INTEGER DEFAULT 0,
ADD COLUMN     "metric_fail_threshold" DOUBLE PRECISION DEFAULT 0,
ADD COLUMN     "metric_id" INTEGER DEFAULT 0,
ADD COLUMN     "outputs" TEXT,
ADD COLUMN     "process_map_exists_ind" INTEGER DEFAULT 0,
ADD COLUMN     "process_map_rating" INTEGER DEFAULT 0,
ADD COLUMN     "process_steps" TEXT,
ADD COLUMN     "related_documents" TEXT,
ADD COLUMN     "risks_and_controls" TEXT,
ADD COLUMN     "step_ownership_roles" TEXT,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "updated_user_id" TEXT;

-- AddForeignKey
ALTER TABLE "drmg"."business_function_procedures" ADD CONSTRAINT "business_function_procedures_metric_id_fkey" FOREIGN KEY ("metric_id") REFERENCES "drmg"."business_function_metrics"("id") ON DELETE SET NULL ON UPDATE CASCADE;
