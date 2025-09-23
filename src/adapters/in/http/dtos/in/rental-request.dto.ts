import { Customer } from "../../../../../domain/customer"
import { RentalItem } from "../../../../../domain/rental-item"

export class RentalRequest {
    constructor(
        public readonly rentalItems: RentalItem[],
        public readonly customer: Customer
    ) { }
}