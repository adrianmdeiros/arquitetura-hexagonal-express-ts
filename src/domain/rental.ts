import { Customer } from "./customer";
import { RentalItem } from "./rental-item";

export class Rental {

    constructor(
        public readonly customer: Customer,
        public readonly date: Date = new Date(Date.now()),
        public readonly rentalItems?: RentalItem[],
    ) { }

    static rehydrate(
        id: number, 
        date: Date = new Date(Date.now()), 
        rentalItems: RentalItem[], customer: Customer) {
        const rental = new Rental(customer, date, rentalItems);
        (rental as any).id = id

        return rental
    }

    public readonly id!: number

    addItem(rentalItem: RentalItem): void {
        this.rentalItems?.push(rentalItem);
    }

    calculateTotalCost(): number {
        let totalRentalCost = 0
        this.rentalItems?.forEach((rentalItem) =>
            totalRentalCost += rentalItem.calculateRentalItemCost()
        )
        return totalRentalCost
    }

}