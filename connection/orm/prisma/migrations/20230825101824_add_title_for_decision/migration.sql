/*
  Warnings:

  - Added the required column `title` to the `decision_log` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "drmg"."decision_log" ADD COLUMN     "title" TEXT NOT NULL;
