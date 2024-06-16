-- DropForeignKey
ALTER TABLE "SocialHandles" DROP CONSTRAINT "SocialHandles_userId_fkey";

-- AddForeignKey
ALTER TABLE "SocialHandles" ADD CONSTRAINT "SocialHandles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
