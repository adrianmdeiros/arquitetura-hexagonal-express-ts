import { Console } from "./console"

export class ConsoleUses {

    constructor(
        public readonly console: Console,
        public readonly start: Date,
        public readonly end: Date
    ) { }

    rehydrate(id: number, console: Console, start: Date, end: Date) {
        const consoleUses = new ConsoleUses(console, start, end);
        (consoleUses as any).id = id

        return consoleUses
    }

    public readonly id!: number




}