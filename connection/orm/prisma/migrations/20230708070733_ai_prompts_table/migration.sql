-- CreateTable
CREATE TABLE "drmg"."ai_prompts" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "prompt" TEXT NOT NULL,
    "discipline" TEXT NOT NULL,
    "function" VARCHAR(100) NOT NULL,
    "industry" VARCHAR(100) NOT NULL,
    "tags" TEXT NOT NULL,

    CONSTRAINT "ai_prompts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ai_prompts_title_key" ON "drmg"."ai_prompts"("title");
