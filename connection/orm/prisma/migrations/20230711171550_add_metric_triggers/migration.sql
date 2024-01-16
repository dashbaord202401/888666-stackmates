/*
  Warnings:

  - You are about to drop the column `problem` on the `business_function_metrics` table. All the data in the column will be lost.
  - You are about to drop the column `metric_fail_threshold` on the `business_function_procedures` table. All the data in the column will be lost.
  - You are about to drop the column `metric_id` on the `business_function_procedures` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "drmg"."business_function_procedures" DROP CONSTRAINT "business_function_procedures_metric_id_fkey";

-- AlterTable
ALTER TABLE "drmg"."business_function_metrics" DROP COLUMN "problem",
ADD COLUMN     "default_benchmark" DOUBLE PRECISION,
ADD COLUMN     "improve_with" TEXT,
ADD COLUMN     "measure_unit" TEXT,
ADD COLUMN     "method" TEXT,
ADD COLUMN     "procedure_measured_id" INTEGER;

-- AlterTable
ALTER TABLE "drmg"."business_function_procedures" DROP COLUMN "metric_fail_threshold",
DROP COLUMN "metric_id";

-- CreateTable
CREATE TABLE "drmg"."business_metric_triggers" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "threshold" DOUBLE PRECISION DEFAULT 0,
    "metric_id" INTEGER NOT NULL,

    CONSTRAINT "business_metric_triggers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."business_metric_failure_workflows" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "solution_method" TEXT,
    "failing_metric_id" INTEGER NOT NULL,

    CONSTRAINT "business_metric_failure_workflows_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "business_metric_triggers_name_key" ON "drmg"."business_metric_triggers"("name");

-- CreateIndex
CREATE UNIQUE INDEX "business_metric_failure_workflows_name_key" ON "drmg"."business_metric_failure_workflows"("name");

-- CreateIndex
CREATE UNIQUE INDEX "business_metric_failure_workflows_failing_metric_id_key" ON "drmg"."business_metric_failure_workflows"("failing_metric_id");

-- AddForeignKey
ALTER TABLE "drmg"."business_metric_triggers" ADD CONSTRAINT "business_metric_triggers_metric_id_fkey" FOREIGN KEY ("metric_id") REFERENCES "drmg"."business_function_metrics"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_metric_failure_workflows" ADD CONSTRAINT "business_metric_failure_workflows_failing_metric_id_fkey" FOREIGN KEY ("failing_metric_id") REFERENCES "drmg"."business_function_metrics"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
