import { container } from "tsyringe";
import { ZodValidatorAdapter } from "../../../adapters/in/http/libs/validation/zod/zod-validator";
import { CreateRentalSchema } from "../../../adapters/in/http/libs/validation/zod/schemas/create-rental.schema";
import { RentalMapper } from "../../../adapters/in/http/mappers/rental/rental.mapper";
import { RentalController } from "../../../adapters/in/http/frameworks/express/controllers/rental/rental.controller";

container.register(
    'RentalValidator',
    { useValue: new ZodValidatorAdapter(CreateRentalSchema) }
)

container.register(
    'RentalMapper',
    { useClass: RentalMapper }
)

container.register(
    'RentalController',
    { useClass: RentalController }
)