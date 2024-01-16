-- CreateTable
CREATE TABLE "drmg"."PlayerJourney" (
    "id" SERIAL NOT NULL,
    "focus" VARCHAR(50),
    "weakness" TEXT,
    "intention" TEXT,
    "course" TEXT,
    "obstacles" TEXT,
    "achievement" TEXT,
    "reflection" TEXT,
    "next_steps" TEXT,
    "date_journey_started" TIMESTAMP(3) NOT NULL,
    "date_journey_ended" TIMESTAMP(3) NOT NULL,
    "marketing_spotlight_ind" INTEGER DEFAULT 0,
    "date_created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "date_updated" TIMESTAMP(3) NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "PlayerJourney_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PlayerJourney_user_id_key" ON "drmg"."PlayerJourney"("user_id");

-- AddForeignKey
ALTER TABLE "drmg"."PlayerJourney" ADD CONSTRAINT "PlayerJourney_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
