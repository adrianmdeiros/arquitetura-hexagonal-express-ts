import { Customer } from "../../../../../application/domain/customer"
import { RentalItem } from "../../../../../application/domain/rental-item"

export class RentalResponse {
    constructor(
        public readonly rentalItems: RentalItem[],
        public readonly customer: Customer,
        public readonly date: Date
    ) { }
}