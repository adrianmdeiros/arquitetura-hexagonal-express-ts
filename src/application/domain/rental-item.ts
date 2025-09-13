import { GamePlatform } from "./game-platform"
import { Rental } from "./rental"

export class RentalItem {
    public gamePlatform: GamePlatform
    public rental: Rental

    constructor(
        public readonly days: number,
        public readonly quantity: number
    ) { }

    calculateRentalItemCost(): number {
        return (this.days * Number(this.gamePlatform.dailyPrice))
    }

}