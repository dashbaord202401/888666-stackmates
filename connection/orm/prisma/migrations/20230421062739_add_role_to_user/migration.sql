-- AlterTable
ALTER TABLE "public"."User" ADD COLUMN     "gs_provider_id" INTEGER,
ADD COLUMN     "gs_user_id" INTEGER,
ADD COLUMN     "role" TEXT;
