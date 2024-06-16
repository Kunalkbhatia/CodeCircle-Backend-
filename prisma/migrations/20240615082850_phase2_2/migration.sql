/*
  Warnings:

  - Made the column `likes` on table `Comment` required. This step will fail if there are existing NULL values in that column.
  - Made the column `likes` on table `GeneralPost` required. This step will fail if there are existing NULL values in that column.
  - Made the column `solved` on table `QueryPost` required. This step will fail if there are existing NULL values in that column.
  - Made the column `likes` on table `QueryPost` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Comment" ALTER COLUMN "likes" SET NOT NULL;

-- AlterTable
ALTER TABLE "GeneralPost" ALTER COLUMN "likes" SET NOT NULL;

-- AlterTable
ALTER TABLE "QueryPost" ALTER COLUMN "solved" SET NOT NULL,
ALTER COLUMN "likes" SET NOT NULL;
