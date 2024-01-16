/*
  Warnings:

  - You are about to drop the column `gensolve_id` on the `problems` table. All the data in the column will be lost.
  - You are about to drop the column `gensolve_name` on the `problems` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "drmg"."problems" DROP COLUMN "gensolve_id",
DROP COLUMN "gensolve_name",
ADD COLUMN     "focus_area" TEXT,
ADD COLUMN     "import_system" VARCHAR(255),
ADD COLUMN     "import_system_id" INTEGER,
ADD COLUMN     "import_system_name" VARCHAR(255),
ALTER COLUMN "std_solution_cost" SET DEFAULT 0,
ALTER COLUMN "std_solution_interval" SET DEFAULT 'Months',
ALTER COLUMN "std_solution_phases" SET DEFAULT 1,
ALTER COLUMN "std_solution_sessions" SET DEFAULT 1,
ALTER COLUMN "std_solution_timeframe" SET DEFAULT 1;

-- AlterTable
ALTER TABLE "practice"."revenue_items" ADD COLUMN     "report_product_ind" INTEGER DEFAULT 0;
