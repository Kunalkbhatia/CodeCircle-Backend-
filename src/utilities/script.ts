import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export async function main() {
  try{

    await prisma.user.deleteMany();
    await prisma.$disconnect()
    console.log("deleted users")
  }
  catch(error){
    console.error(error)
    await prisma.$disconnect()
    process.exit(1)
  }
}

main()