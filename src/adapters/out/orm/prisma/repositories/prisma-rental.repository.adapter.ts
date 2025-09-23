import { PrismaClient } from "@prisma/client";
import { Rental } from "../../../../../domain/rental";
import { RentalItem } from "../../../../../domain/rental-item";
import { RentalRepositoryOutputPort } from "../../../../../application/ports/out/rental.repository.output.port";
import { Customer } from "../../../../../domain/customer";
import { GamePlatform } from "../../../../../domain/game-platform";
import { inject, injectable } from "tsyringe";

@injectable()
export class PrismaRentalRepositoryAdapter implements RentalRepositoryOutputPort {

    constructor(
        @inject('PrismaClient') private prisma: PrismaClient
    ) { }

    async save(rental: Rental): Promise<Rental> {
        const savedRental = await this.prisma.rental.create({
            data: {
                customerId: rental.customer.id,
                date: rental.date,
                rentalItems: {
                    create: rental.rentalItems?.map(item => ({
                        gameId: item.gamePlatform.game.id,
                        platformId: item.gamePlatform.platform.id,
                        days: item.days,
                        quantity: item.quantity
                    }))
                }
            },
            select: {
                id: true,
                rentalItems: {
                    include: {
                        gamePlatform: {
                            include: {
                                game: true,
                                platform: true
                            }
                        },
                        rental: true
                    }
                },
                customer: true,
                date: true
            }
        })

        const rentalItems = savedRental.rentalItems.map(item => {
            const rentalItem = new RentalItem(item.days, item.quantity)
            rentalItem['gamePlatform'] = item.gamePlatform as unknown as GamePlatform
            rentalItem['rental'] = savedRental as unknown as Rental
            return rentalItem
        })

        const customer = Customer.rehydrate(
            savedRental.customer.id,
            savedRental.customer.name,
            savedRental.customer.email,
            savedRental.customer.phone,
            savedRental.customer.password
        )

        return Rental.rehydrate(
            savedRental.id,
            savedRental.date,
            rentalItems,
            customer
        )
    }

    async findById(id: number): Promise<Rental> {
        throw new Error("Method not implemented.");
    }

    findAll(): Promise<Rental[]> {
        throw new Error("Method not implemented.");
    }

    update(id: number, data: Partial<Rental>): Promise<Rental> {
        throw new Error("Method not implemented.");
    }

    delete(id: number): Promise<void> {
        throw new Error("Method not implemented.");
    }


}