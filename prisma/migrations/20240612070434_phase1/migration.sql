/*
  Warnings:

  - The primary key for the `SocialHandles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `socialhandlesId` on the `SocialHandles` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `SocialHandles` table. All the data in the column will be lost.
  - You are about to drop the column `college` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `experienceYear` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `lastname` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `user_id` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_Id]` on the table `SocialHandles` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `user_Id` to the `SocialHandles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `collage` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "SocialHandles" DROP CONSTRAINT "SocialHandles_userId_fkey";

-- DropIndex
DROP INDEX "SocialHandles_userId_key";

-- DropIndex
DROP INDEX "User_user_id_key";

-- AlterTable
ALTER TABLE "SocialHandles" DROP CONSTRAINT "SocialHandles_pkey",
DROP COLUMN "socialhandlesId",
DROP COLUMN "userId",
ADD COLUMN     "linkedIn" TEXT,
ADD COLUMN     "other" TEXT,
ADD COLUMN     "socialHandlesId" SERIAL NOT NULL,
ADD COLUMN     "user_Id" INTEGER NOT NULL,
ALTER COLUMN "twitter" DROP NOT NULL,
ALTER COLUMN "instagram" DROP NOT NULL,
ALTER COLUMN "github" DROP NOT NULL,
ALTER COLUMN "portfolio" DROP NOT NULL,
ADD CONSTRAINT "SocialHandles_pkey" PRIMARY KEY ("socialHandlesId");

-- AlterTable
ALTER TABLE "User" DROP COLUMN "college",
DROP COLUMN "experienceYear",
DROP COLUMN "lastname",
DROP COLUMN "user_id",
ADD COLUMN     "collage" TEXT NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "experience" INTEGER DEFAULT 0,
ADD COLUMN     "lastName" TEXT,
ADD COLUMN     "userId" SERIAL NOT NULL,
ALTER COLUMN "company" DROP NOT NULL,
ALTER COLUMN "techStack" DROP NOT NULL,
ALTER COLUMN "techStack" SET DEFAULT 'Not availabe',
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("userId");

-- CreateTable
CREATE TABLE "GeneralPost" (
    "generalPostId" SERIAL NOT NULL,
    "user_Id" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "likes" INTEGER DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GeneralPost_pkey" PRIMARY KEY ("generalPostId")
);

-- CreateTable
CREATE TABLE "QueryPost" (
    "queryPostId" SERIAL NOT NULL,
    "user_Id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "solved" BOOLEAN DEFAULT false,
    "likes" INTEGER DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "QueryPost_pkey" PRIMARY KEY ("queryPostId")
);

-- CreateTable
CREATE TABLE "Comment" (
    "commentId" SERIAL NOT NULL,
    "generalPost_Id" INTEGER,
    "queryPost_Id" INTEGER,
    "comment" TEXT NOT NULL,
    "likes" INTEGER DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("commentId")
);

-- CreateIndex
CREATE UNIQUE INDEX "SocialHandles_user_Id_key" ON "SocialHandles"("user_Id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "GeneralPost" ADD CONSTRAINT "GeneralPost_user_Id_fkey" FOREIGN KEY ("user_Id") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QueryPost" ADD CONSTRAINT "QueryPost_user_Id_fkey" FOREIGN KEY ("user_Id") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_generalPost_Id_fkey" FOREIGN KEY ("generalPost_Id") REFERENCES "GeneralPost"("generalPostId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_queryPost_Id_fkey" FOREIGN KEY ("queryPost_Id") REFERENCES "QueryPost"("queryPostId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SocialHandles" ADD CONSTRAINT "SocialHandles_user_Id_fkey" FOREIGN KEY ("user_Id") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;
