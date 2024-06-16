/*
  Warnings:

  - Made the column `experience` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "User" ALTER COLUMN "experience" SET NOT NULL;
