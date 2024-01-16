-- CreateTable
CREATE TABLE "drmg"."business_ideas" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_ideas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."idea_categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "idea_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."business_idea_analysis" (
    "id" SERIAL NOT NULL,
    "riskFactor" DOUBLE PRECISION NOT NULL,
    "expectedReturns" DOUBLE PRECISION NOT NULL,
    "timeHorizon" TEXT NOT NULL,
    "businessIdeaId" INTEGER NOT NULL,

    CONSTRAINT "business_idea_analysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."business_jtbd_interviews" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "respondent" TEXT NOT NULL,
    "job" TEXT NOT NULL,
    "painPoints" TEXT NOT NULL,
    "outcome" TEXT NOT NULL,
    "businessIdeaId" INTEGER NOT NULL,

    CONSTRAINT "business_jtbd_interviews_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."_CategoryToIdea" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "business_ideas_title_key" ON "drmg"."business_ideas"("title");

-- CreateIndex
CREATE UNIQUE INDEX "idea_categories_name_key" ON "drmg"."idea_categories"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToIdea_AB_unique" ON "drmg"."_CategoryToIdea"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToIdea_B_index" ON "drmg"."_CategoryToIdea"("B");

-- AddForeignKey
ALTER TABLE "drmg"."business_idea_analysis" ADD CONSTRAINT "business_idea_analysis_businessIdeaId_fkey" FOREIGN KEY ("businessIdeaId") REFERENCES "drmg"."business_ideas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."business_jtbd_interviews" ADD CONSTRAINT "business_jtbd_interviews_businessIdeaId_fkey" FOREIGN KEY ("businessIdeaId") REFERENCES "drmg"."business_ideas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."_CategoryToIdea" ADD CONSTRAINT "_CategoryToIdea_A_fkey" FOREIGN KEY ("A") REFERENCES "drmg"."business_ideas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."_CategoryToIdea" ADD CONSTRAINT "_CategoryToIdea_B_fkey" FOREIGN KEY ("B") REFERENCES "drmg"."idea_categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;
