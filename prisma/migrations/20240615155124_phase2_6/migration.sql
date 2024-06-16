/*
  Warnings:

  - You are about to drop the column `Bio` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `Title` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "Bio",
DROP COLUMN "Title",
ADD COLUMN     "bio" TEXT,
ADD COLUMN     "title" TEXT;
