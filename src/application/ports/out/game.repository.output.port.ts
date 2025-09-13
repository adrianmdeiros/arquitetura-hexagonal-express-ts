import { Game } from "../../domain/game";

export interface GameRepositoryOutputPort {
    save(game: Game): Promise<Game>
    //...
}