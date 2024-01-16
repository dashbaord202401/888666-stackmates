-- AlterTable
ALTER TABLE "drmg"."business_function_metrics" ADD COLUMN     "industry_specific_ind" INTEGER DEFAULT 0,
ADD COLUMN     "problem" TEXT;

-- AlterTable
ALTER TABLE "drmg"."organisations" ADD COLUMN     "gensolve_name" TEXT,
ADD COLUMN     "gensolve_org_id" INTEGER,
ADD COLUMN     "gensolve_vendor_id" INTEGER;

-- CreateTable
CREATE TABLE "warehouse"."business_metric_results" (
    "id" SERIAL NOT NULL,
    "business_id" INTEGER NOT NULL,
    "metric_id" INTEGER NOT NULL,
    "grouped_by" TEXT NOT NULL,
    "group_entity" TEXT NOT NULL,
    "group_entity_id" INTEGER,
    "value" DOUBLE PRECISION,
    "date" TIMESTAMP(3),
    "measured_period" TEXT NOT NULL,

    CONSTRAINT "business_metric_results_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "warehouse"."business_metric_results" ADD CONSTRAINT "business_metric_results_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "drmg"."organisations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."business_metric_results" ADD CONSTRAINT "business_metric_results_metric_id_fkey" FOREIGN KEY ("metric_id") REFERENCES "drmg"."business_function_metrics"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
