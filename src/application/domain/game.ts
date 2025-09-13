import { Platform } from "./platform";

export class Game {
    constructor(
        public readonly name: string,
        public readonly platforms?: Platform[]
    ) { }

    static rehydrate(id: number, name: string, platforms: Platform[]): Game {
        const game = new Game(name, platforms);
        (game as any).id = id
        
        return game
    }

    public readonly id!: number
}