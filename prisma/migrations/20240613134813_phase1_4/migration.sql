/*
  Warnings:

  - The primary key for the `Comment` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `generalPostId` was added to the `GeneralPost` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `queryPostId` was added to the `QueryPost` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `socialHandlesId` was added to the `SocialHandles` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `userId` was added to the `User` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "commentId" DROP DEFAULT,
ALTER COLUMN "commentId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Comment_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Comment_commentId_seq";

-- AlterTable
ALTER TABLE "GeneralPost" ADD COLUMN     "generalPostId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "QueryPost" ADD COLUMN     "queryPostId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "SocialHandles" ADD COLUMN     "socialHandlesId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "userId" TEXT NOT NULL;
