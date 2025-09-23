import { ConsoleUses } from "./console-uses"
import { ConsoleAcessories } from "./console-acessories"

export class Console {

    constructor(
        public readonly name: string,
        public readonly pricePerHour: number,
        public readonly consoleUses: ConsoleUses[] = [],
        public readonly acessories: ConsoleAcessories[] = []
    ) { }

    rehydrate(
        id: number,
        name: string,
        pricePerHour: number,
        consoleUses: ConsoleUses[] = [],
        acessories: ConsoleAcessories[] = []
    ) {
        const console = new Console(name, pricePerHour, consoleUses, acessories);
        (console as any).id = id

        return console
    }


    public readonly id!: number

}