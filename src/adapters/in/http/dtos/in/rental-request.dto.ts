import { Customer } from "../../../../../application/domain/customer"
import { RentalItem } from "../../../../../application/domain/rental-item"

export class RentalRequest {
    constructor(
        public readonly rentalItems: RentalItem[],
        public readonly customer: Customer
    ) { }
}