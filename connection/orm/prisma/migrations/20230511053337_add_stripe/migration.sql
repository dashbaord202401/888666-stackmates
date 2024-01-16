-- CreateEnum
CREATE TYPE "public"."StripeSubscriptionStatus" AS ENUM ('incomplete', 'incomplete_expired', 'trialing', 'active', 'past_due', 'canceled', 'unpaid', 'paused');

-- AlterTable
ALTER TABLE "public"."User" ADD COLUMN     "stripe_customer_id" TEXT,
ADD COLUMN     "stripe_subscription_id" TEXT,
ADD COLUMN     "stripe_subscription_status" "public"."StripeSubscriptionStatus";

-- CreateTable
CREATE TABLE "public"."StripeEvent" (
    "id" TEXT NOT NULL,
    "api_version" TEXT,
    "data" JSONB NOT NULL,
    "request" JSONB,
    "type" TEXT NOT NULL,
    "object" TEXT NOT NULL,
    "account" TEXT,
    "created" TIMESTAMP(3) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "pending_webhooks" INTEGER NOT NULL,

    CONSTRAINT "StripeEvent_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StripeEvent_id_key" ON "public"."StripeEvent"("id");
