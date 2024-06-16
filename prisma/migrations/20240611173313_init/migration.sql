-- CreateTable
CREATE TABLE "User" (
    "user_id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "college" TEXT NOT NULL,
    "graduationYear" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "experienceYear" TEXT NOT NULL,
    "techStack" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "SocialHandles" (
    "socialhandlesId" TEXT NOT NULL,
    "twitter" TEXT NOT NULL,
    "instagram" TEXT NOT NULL,
    "github" TEXT NOT NULL,
    "portfolio" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "SocialHandles_pkey" PRIMARY KEY ("socialhandlesId")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_user_id_key" ON "User"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "SocialHandles_userId_key" ON "SocialHandles"("userId");

-- AddForeignKey
ALTER TABLE "SocialHandles" ADD CONSTRAINT "SocialHandles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;
