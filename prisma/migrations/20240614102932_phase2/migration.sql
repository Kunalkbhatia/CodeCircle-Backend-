/*
  Warnings:

  - The primary key for the `Comment` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `commentId` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `generalPost_Id` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `queryPost_Id` on the `Comment` table. All the data in the column will be lost.
  - The primary key for the `GeneralPost` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `generalPostId` on the `GeneralPost` table. All the data in the column will be lost.
  - The primary key for the `QueryPost` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `queryPostId` on the `QueryPost` table. All the data in the column will be lost.
  - The primary key for the `SocialHandles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `socialHandlesId` on the `SocialHandles` table. All the data in the column will be lost.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `userId` on the `User` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_generalPost_Id_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_queryPost_Id_fkey";

-- DropForeignKey
ALTER TABLE "GeneralPost" DROP CONSTRAINT "GeneralPost_userId_fkey";

-- DropForeignKey
ALTER TABLE "QueryPost" DROP CONSTRAINT "QueryPost_userId_fkey";

-- DropForeignKey
ALTER TABLE "SocialHandles" DROP CONSTRAINT "SocialHandles_userId_fkey";

-- AlterTable
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_pkey",
DROP COLUMN "commentId",
DROP COLUMN "generalPost_Id",
DROP COLUMN "queryPost_Id",
ADD COLUMN     "generalPostId" TEXT,
ADD COLUMN     "queryPostId" TEXT,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Comment_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Comment_id_seq";

-- AlterTable
ALTER TABLE "GeneralPost" DROP CONSTRAINT "GeneralPost_pkey",
DROP COLUMN "generalPostId",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "userId" SET DATA TYPE TEXT,
ADD CONSTRAINT "GeneralPost_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "GeneralPost_id_seq";

-- AlterTable
ALTER TABLE "QueryPost" DROP CONSTRAINT "QueryPost_pkey",
DROP COLUMN "queryPostId",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "userId" SET DATA TYPE TEXT,
ADD CONSTRAINT "QueryPost_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "QueryPost_id_seq";

-- AlterTable
ALTER TABLE "SocialHandles" DROP CONSTRAINT "SocialHandles_pkey",
DROP COLUMN "socialHandlesId",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "userId" SET DATA TYPE TEXT,
ADD CONSTRAINT "SocialHandles_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "SocialHandles_id_seq";

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "userId",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "User_id_seq";

-- AddForeignKey
ALTER TABLE "SocialHandles" ADD CONSTRAINT "SocialHandles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GeneralPost" ADD CONSTRAINT "GeneralPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QueryPost" ADD CONSTRAINT "QueryPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_generalPostId_fkey" FOREIGN KEY ("generalPostId") REFERENCES "GeneralPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_queryPostId_fkey" FOREIGN KEY ("queryPostId") REFERENCES "QueryPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;
