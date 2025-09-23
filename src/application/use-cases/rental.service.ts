import { inject, injectable } from "tsyringe";
import { RentalServiceInputPort } from "../ports/in/rental.service.input.port";
import { RentalRepositoryOutputPort } from "../ports/out/rental.repository.output.port";
import { Rental } from "../../domain/rental";
import { RentalItem } from "../../domain/rental-item";

@injectable()
export class RentalService implements RentalServiceInputPort {

    constructor(
        @inject('RentalRepositoryOutputPort')
        private readonly rentalRepository: RentalRepositoryOutputPort
    ) { }

    async create(rental: Rental): Promise<Rental> {
        return await this.rentalRepository.save(rental)
    }

    addGameToRental(rentalItem: RentalItem, rental: Rental): void {
        return rental.addItem(rentalItem)
    }

    calculateTotalRentalCost(rental: Rental): number {
        return rental.calculateTotalCost()
    }

}