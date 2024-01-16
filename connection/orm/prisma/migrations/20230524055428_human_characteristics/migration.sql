-- AlterTable
ALTER TABLE "warehouse"."client_facts" ADD COLUMN     "social_facebook" VARCHAR(255),
ADD COLUMN     "social_influence_rank" INTEGER DEFAULT 0,
ADD COLUMN     "social_instagram" VARCHAR(255),
ADD COLUMN     "social_twitter" VARCHAR(255),
ADD COLUMN     "social_youtube" VARCHAR(255);

-- CreateTable
CREATE TABLE "warehouse"."client_motivations" (
    "client_id" INTEGER NOT NULL,
    "motivation_id" INTEGER NOT NULL,
    "subjective" TEXT,
    "subjective_rank" INTEGER DEFAULT 0,
    "objective" TEXT,
    "objective_rank" INTEGER DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "client_motivations_pkey" PRIMARY KEY ("client_id","motivation_id")
);

-- CreateTable
CREATE TABLE "warehouse"."human_capabilities" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_capabilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."human_values" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."human_traits" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_traits_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."human_behaviours" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_behaviours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."human_triggers" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_triggers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "warehouse"."human_motivations" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),

    CONSTRAINT "human_motivations_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "warehouse"."client_motivations" ADD CONSTRAINT "client_motivations_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "warehouse"."client_facts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "warehouse"."client_motivations" ADD CONSTRAINT "client_motivations_motivation_id_fkey" FOREIGN KEY ("motivation_id") REFERENCES "warehouse"."human_motivations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
