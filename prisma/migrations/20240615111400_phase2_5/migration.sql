/*
  Warnings:

  - Made the column `likes` on table `Comment` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Comment" ALTER COLUMN "likes" SET NOT NULL;
