import { ConsoleUses } from "./console-uses";
import { Rental } from "./rental";
import { RentalItem } from "./rental-item";

export class Customer {

  constructor(
    public readonly name: string,
    public readonly email: string,
    public readonly phone: string,
    public readonly password: string,
    public readonly rentals?: Rental[],
    public readonly consoleUses?: ConsoleUses[]
  ) { }

  static rehydrate(
    id: number,
    name: string,
    email: string,
    phone: string,
    password: string,
    rentals?: Rental[],
    consoleUses?: ConsoleUses[]
  ) {
    const customer = new Customer(name, email, phone, password, rentals, consoleUses);
    (customer as any).id = id

    return customer
  }

  public readonly id!: number

  rent(items: RentalItem[]) {
    const rental = new Rental(this, new Date(Date.now()), items)
    rental.calculateTotalCost()
    return rental
  }

}