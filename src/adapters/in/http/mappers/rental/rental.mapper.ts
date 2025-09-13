import { injectable } from "tsyringe"
import { Rental } from "../../../../../application/domain/rental"
import { RentalRequest } from "../../dtos/in/rental-request.dto"
import { RentalResponse } from "../../dtos/out/rental-response.dto"

@injectable()
export class RentalMapper {

    toRental({ rentalItems, customer }: RentalRequest): Rental {
        return new Rental(customer, new Date(Date.now()), rentalItems)
    }

    toRentalRequest({ rentalItems, customer }: any): RentalRequest {
        return new RentalRequest(rentalItems, customer)
    }

    toRentalResponse({ rentalItems, customer, date }: Rental): RentalResponse {
        return {
            date,
            customer,
            rentalItems: rentalItems!,
        }
    }
}