-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "drmg";

-- CreateTable
CREATE TABLE "drmg"."Board" (
    "name" VARCHAR(255) NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "id" SERIAL NOT NULL,

    CONSTRAINT "Board_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."Column" (
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "id" SERIAL NOT NULL,
    "boardId" INTEGER NOT NULL,

    CONSTRAINT "Column_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."Task" (
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "statusName" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "id" SERIAL NOT NULL,
    "boardId" INTEGER NOT NULL,
    "order" SERIAL NOT NULL,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."SubTask" (
    "title" TEXT NOT NULL,
    "isCompleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "id" SERIAL NOT NULL,
    "taskId" INTEGER NOT NULL,

    CONSTRAINT "SubTask_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Column_name_boardId_key" ON "drmg"."Column"("name", "boardId");

-- CreateIndex
CREATE UNIQUE INDEX "Task_title_boardId_key" ON "drmg"."Task"("title", "boardId");

-- CreateIndex
CREATE UNIQUE INDEX "SubTask_title_taskId_key" ON "drmg"."SubTask"("title", "taskId");

-- AddForeignKey
ALTER TABLE "drmg"."Board" ADD CONSTRAINT "Board_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."Column" ADD CONSTRAINT "Column_boardId_fkey" FOREIGN KEY ("boardId") REFERENCES "drmg"."Board"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."Task" ADD CONSTRAINT "Task_statusName_boardId_fkey" FOREIGN KEY ("statusName", "boardId") REFERENCES "drmg"."Column"("name", "boardId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."SubTask" ADD CONSTRAINT "SubTask_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "drmg"."Task"("id") ON DELETE CASCADE ON UPDATE CASCADE;
