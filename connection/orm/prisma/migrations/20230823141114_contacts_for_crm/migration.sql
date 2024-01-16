-- AlterTable
ALTER TABLE "drmg"."human_contacts" ADD COLUMN     "conversations" TEXT,
ADD COLUMN     "drmg_org_id" INTEGER,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "notes" TEXT,
ADD COLUMN     "social_facebook" VARCHAR(255),
ADD COLUMN     "social_influence_rank" INTEGER DEFAULT 0,
ADD COLUMN     "social_instagram" VARCHAR(255),
ADD COLUMN     "social_linkedin" VARCHAR(255),
ADD COLUMN     "social_tiktok" VARCHAR(255),
ADD COLUMN     "social_x" VARCHAR(255),
ADD COLUMN     "social_youtube" VARCHAR(255);

-- CreateTable
CREATE TABLE "drmg"."human_contact_problems" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "notes" TEXT,
    "organisation_id" INTEGER NOT NULL,

    CONSTRAINT "human_contact_problems_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drmg"."human_interactions" (
    "id" SERIAL NOT NULL,
    "contact_id" INTEGER NOT NULL,
    "user_id" TEXT NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "agenda" TEXT,
    "notes" TEXT,

    CONSTRAINT "human_interactions_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "drmg"."human_interactions" ADD CONSTRAINT "human_interactions_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "drmg"."human_contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drmg"."human_interactions" ADD CONSTRAINT "human_interactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
