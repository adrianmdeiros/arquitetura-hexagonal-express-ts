import { Rental } from '../../domain/rental';

export interface RentalRepositoryOutputPort {
    save(rental: Rental): Promise<Rental>
    findAll(): Promise<Rental[]>
    findById(id: number): Promise<Rental>
    update(id: number, data: Partial<Rental>): Promise<Rental>
    delete(id: number): Promise<void>
}