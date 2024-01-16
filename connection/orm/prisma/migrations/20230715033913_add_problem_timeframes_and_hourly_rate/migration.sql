-- AlterTable
ALTER TABLE "drmg"."problems" ADD COLUMN     "best_solution_id" INTEGER,
ADD COLUMN     "gensolve_id" INTEGER,
ADD COLUMN     "gensolve_name" VARCHAR(255),
ADD COLUMN     "std_solution_cost" DECIMAL(65,30),
ADD COLUMN     "std_solution_interval" VARCHAR(255),
ADD COLUMN     "std_solution_phases" INTEGER,
ADD COLUMN     "std_solution_sessions" INTEGER,
ADD COLUMN     "std_solution_timeframe" INTEGER;

-- AlterTable
ALTER TABLE "practice"."system_users" ADD COLUMN     "contractor_ind" INTEGER,
ADD COLUMN     "hourly_rate" DOUBLE PRECISION;

-- CreateTable
CREATE TABLE "drmg"."solution_protocols" (
    "id" SERIAL NOT NULL,
    "problem_id" INTEGER NOT NULL,
    "solution_desc" TEXT NOT NULL,
    "solution_interval" VARCHAR(255),
    "solution_timeframe" INTEGER,
    "solution_sessions" INTEGER,
    "solution_phases" INTEGER,
    "solution_cost" DECIMAL(65,30),

    CONSTRAINT "solution_protocols_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."solution_protocol_milestones" (
    "id" SERIAL NOT NULL,
    "solution_id" INTEGER NOT NULL,
    "progress_date" DATE NOT NULL,
    "progress_check" VARCHAR(255),

    CONSTRAINT "solution_protocol_milestones_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "drmg"."problems" ADD CONSTRAINT "problems_best_solution_id_fkey" FOREIGN KEY ("best_solution_id") REFERENCES "drmg"."solution_protocols"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."solution_protocols" ADD CONSTRAINT "solution_protocols_problem_id_fkey" FOREIGN KEY ("problem_id") REFERENCES "drmg"."problems"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."solution_protocol_milestones" ADD CONSTRAINT "solution_protocol_milestones_solution_id_fkey" FOREIGN KEY ("solution_id") REFERENCES "drmg"."solution_protocols"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
