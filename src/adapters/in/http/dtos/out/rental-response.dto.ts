import { Customer } from "../../../../../domain/customer"
import { RentalItem } from "../../../../../domain/rental-item"

export class RentalResponse {
    constructor(
        public readonly rentalItems: RentalItem[],
        public readonly customer: Customer,
        public readonly date: Date
    ) { }
}