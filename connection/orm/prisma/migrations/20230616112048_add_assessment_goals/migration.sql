-- CreateTable
CREATE TABLE "practice"."assessments" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "owner_id" INTEGER NOT NULL,
    "owner_type_id" INTEGER NOT NULL,
    "owner_type" TEXT NOT NULL,
    "clinician_type_id" INTEGER NOT NULL,
    "clinician_type" TEXT,
    "mechanism" TEXT,
    "provisional_diagnosis" TEXT,
    "deleted_ind" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "assessments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "practice"."assessment_goals" (
    "id" SERIAL NOT NULL,
    "import_id" INTEGER NOT NULL,
    "vendorId" INTEGER NOT NULL,
    "assessment_id" INTEGER NOT NULL,
    "goal_id" INTEGER NOT NULL,
    "goal" TEXT,
    "goal_name" TEXT,
    "goal_details" TEXT,
    "activity_id" INTEGER NOT NULL,
    "activity_name" TEXT,
    "activity_details" TEXT,
    "estimated_treatments" INTEGER NOT NULL DEFAULT 0,
    "timeframe" INTEGER NOT NULL,
    "timeframe_type_id" INTEGER NOT NULL,
    "timeframe_type_name" TEXT,
    "notes" TEXT,
    "plan_notes" TEXT,
    "mid_notes" TEXT,
    "final_notes" TEXT,
    "non_completion_notes" TEXT,
    "achieved_ind" INTEGER NOT NULL DEFAULT 0,
    "created_date" TIMESTAMP(3) NOT NULL,
    "start_by_date" TIMESTAMP(3) NOT NULL,
    "started_date" TIMESTAMP(3) NOT NULL,
    "complete_by_date" TIMESTAMP(3) NOT NULL,
    "completed_date" TIMESTAMP(3),

    CONSTRAINT "assessment_goals_pkey" PRIMARY KEY ("id")
);
