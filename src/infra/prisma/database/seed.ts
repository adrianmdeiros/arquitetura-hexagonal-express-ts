import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  // Plataformas
  const ps5 = await prisma.platform.create({ data: { name: 'PS5' } })
  const xbox = await prisma.platform.create({ data: { name: 'Xbox Series X' } })

  // Jogos + gamePlatform
  const fifa = await prisma.game.create({
    data: {
      name: 'FIFA 24',
      platforms: { connect: [{ id: ps5.id }, { id: xbox.id }] },
      gamePlatform: {
        create: [
          { platformId: ps5.id, dailyPrice: 10.0 }, // usando number
          { platformId: xbox.id, dailyPrice: 9.5 }
        ]
      }
    }
  })

  const gta = await prisma.game.create({
    data: {
      name: 'GTA V',
      platforms: { connect: [{ id: ps5.id }] },
      gamePlatform: {
        create: [
          { platformId: ps5.id, dailyPrice: 8.0 }
        ]
      }
    }
  })

  // Cliente
  const customer = await prisma.customer.create({
    data: {
      name: 'Maria Oliveira',
      email: 'maria@example.com',
      phone: '11988887777',
      password: 'senha_segura'
    }
  })

  // Aluguel
  await prisma.rental.create({
    data: {
      customerId: customer.id,
      rentalItems: {
        create: [
          {
            gameId: fifa.id,
            platformId: ps5.id,
            days: 4,
            quantity: 1
          },
          {
            gameId: gta.id,
            platformId: ps5.id,
            days: 2,
            quantity: 2
          }
        ]
      }
    }
  })

  // Console + acessórios
  await prisma.console.create({
    data: {
      name: 'PlayStation 5',
      pricePerHour: 15.0, // usando number
      acessories: {
        create: [
          { name: 'Headset' },
          { name: 'Controle Adicional' }
        ]
      }
    }
  })

  // Uso do console
  await prisma.consoleUses.create({
    data: {
      customerId: customer.id
    }
  })
}

main()
  .catch((e) => {
    console.error('Erro no seed:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
