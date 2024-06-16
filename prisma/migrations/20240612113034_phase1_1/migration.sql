/*
  Warnings:

  - You are about to drop the column `comment` on the `Comment` table. All the data in the column will be lost.
  - The primary key for the `GeneralPost` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `generalPostId` on the `GeneralPost` table. All the data in the column will be lost.
  - You are about to drop the column `user_Id` on the `GeneralPost` table. All the data in the column will be lost.
  - The primary key for the `QueryPost` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `queryPostId` on the `QueryPost` table. All the data in the column will be lost.
  - You are about to drop the column `user_Id` on the `QueryPost` table. All the data in the column will be lost.
  - The primary key for the `SocialHandles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `socialHandlesId` on the `SocialHandles` table. All the data in the column will be lost.
  - You are about to drop the column `user_Id` on the `SocialHandles` table. All the data in the column will be lost.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `userId` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userId]` on the table `SocialHandles` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `GeneralPost` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `QueryPost` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `SocialHandles` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_generalPost_Id_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_queryPost_Id_fkey";

-- DropForeignKey
ALTER TABLE "GeneralPost" DROP CONSTRAINT "GeneralPost_user_Id_fkey";

-- DropForeignKey
ALTER TABLE "QueryPost" DROP CONSTRAINT "QueryPost_user_Id_fkey";

-- DropForeignKey
ALTER TABLE "SocialHandles" DROP CONSTRAINT "SocialHandles_user_Id_fkey";

-- DropIndex
DROP INDEX "SocialHandles_user_Id_key";

-- AlterTable
ALTER TABLE "Comment" DROP COLUMN "comment";

-- AlterTable
ALTER TABLE "GeneralPost" DROP CONSTRAINT "GeneralPost_pkey",
DROP COLUMN "generalPostId",
DROP COLUMN "user_Id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "GeneralPost_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "QueryPost" DROP CONSTRAINT "QueryPost_pkey",
DROP COLUMN "queryPostId",
DROP COLUMN "user_Id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "QueryPost_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "SocialHandles" DROP CONSTRAINT "SocialHandles_pkey",
DROP COLUMN "socialHandlesId",
DROP COLUMN "user_Id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "SocialHandles_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "userId",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "techStack" DROP DEFAULT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "SocialHandles_userId_key" ON "SocialHandles"("userId");

-- AddForeignKey
ALTER TABLE "SocialHandles" ADD CONSTRAINT "SocialHandles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GeneralPost" ADD CONSTRAINT "GeneralPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QueryPost" ADD CONSTRAINT "QueryPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_generalPost_Id_fkey" FOREIGN KEY ("generalPost_Id") REFERENCES "GeneralPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_queryPost_Id_fkey" FOREIGN KEY ("queryPost_Id") REFERENCES "QueryPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;
