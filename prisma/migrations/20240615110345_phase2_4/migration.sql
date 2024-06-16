/*
  Warnings:

  - You are about to drop the column `likes` on the `GeneralPost` table. All the data in the column will be lost.
  - You are about to drop the column `likes` on the `QueryPost` table. All the data in the column will be lost.
  - Added the required column `userId` to the `Comment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_generalPostId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_queryPostId_fkey";

-- DropForeignKey
ALTER TABLE "GeneralPost" DROP CONSTRAINT "GeneralPost_userId_fkey";

-- DropForeignKey
ALTER TABLE "QueryPost" DROP CONSTRAINT "QueryPost_userId_fkey";

-- AlterTable
ALTER TABLE "Comment" ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "GeneralPost" DROP COLUMN "likes";

-- AlterTable
ALTER TABLE "QueryPost" DROP COLUMN "likes";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "Bio" TEXT,
ADD COLUMN     "Title" TEXT;

-- CreateTable
CREATE TABLE "UserLikedGeneralPost" (
    "userId" TEXT NOT NULL,
    "generalPostId" TEXT NOT NULL,

    CONSTRAINT "UserLikedGeneralPost_pkey" PRIMARY KEY ("userId","generalPostId")
);

-- CreateTable
CREATE TABLE "UserLikedQueryPost" (
    "userId" TEXT NOT NULL,
    "QueryPostId" TEXT NOT NULL,

    CONSTRAINT "UserLikedQueryPost_pkey" PRIMARY KEY ("userId","QueryPostId")
);

-- CreateTable
CREATE TABLE "_followers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_followers_AB_unique" ON "_followers"("A", "B");

-- CreateIndex
CREATE INDEX "_followers_B_index" ON "_followers"("B");

-- AddForeignKey
ALTER TABLE "GeneralPost" ADD CONSTRAINT "GeneralPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QueryPost" ADD CONSTRAINT "QueryPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_generalPostId_fkey" FOREIGN KEY ("generalPostId") REFERENCES "GeneralPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_queryPostId_fkey" FOREIGN KEY ("queryPostId") REFERENCES "QueryPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserLikedGeneralPost" ADD CONSTRAINT "UserLikedGeneralPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserLikedGeneralPost" ADD CONSTRAINT "UserLikedGeneralPost_generalPostId_fkey" FOREIGN KEY ("generalPostId") REFERENCES "GeneralPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserLikedQueryPost" ADD CONSTRAINT "UserLikedQueryPost_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserLikedQueryPost" ADD CONSTRAINT "UserLikedQueryPost_QueryPostId_fkey" FOREIGN KEY ("QueryPostId") REFERENCES "QueryPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_followers" ADD CONSTRAINT "_followers_A_fkey" FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_followers" ADD CONSTRAINT "_followers_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
