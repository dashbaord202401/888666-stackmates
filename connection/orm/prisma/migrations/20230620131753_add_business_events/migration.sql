-- CreateTable
CREATE TABLE "practice"."business_events" (
    "id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "date_of_report" TIMESTAMP(3) NOT NULL,
    "event_type" TEXT NOT NULL,
    "subject" TEXT,
    "action_to" TEXT,
    "related_contact" TEXT,
    "date_created" TIMESTAMP(3) NOT NULL,
    "date_due" TIMESTAMP(3),
    "date_completed" TIMESTAMP(3),

    CONSTRAINT "business_events_pkey" PRIMARY KEY ("id")
);
