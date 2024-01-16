/*
  Warnings:

  - You are about to drop the column `outcome_date` on the `decision_log` table. All the data in the column will be lost.
  - Added the required column `created_by_user_id` to the `decision_log` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_outcome_reviewed` to the `decision_log` table without a default value. This is not possible if the table is not empty.
  - Added the required column `decision_owner_id` to the `decision_log` table without a default value. This is not possible if the table is not empty.
  - Added the required column `drmg_org_id` to the `decision_log` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_by_user_id` to the `decision_log` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "drmg"."decision_log" DROP COLUMN "outcome_date",
ADD COLUMN     "created_by_user_id" INTEGER NOT NULL,
ADD COLUMN     "date_outcome_reviewed" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "decision_owner_id" TEXT NOT NULL,
ADD COLUMN     "drmg_org_id" INTEGER NOT NULL,
ADD COLUMN     "updated_by_user_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "drmg"."decision_log" ADD CONSTRAINT "decision_log_decision_owner_id_fkey" FOREIGN KEY ("decision_owner_id") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
