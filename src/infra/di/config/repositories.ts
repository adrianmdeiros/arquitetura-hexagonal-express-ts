import { PrismaClient } from "@prisma/client";
import { container } from "tsyringe";
import { RentalRepositoryOutputPort } from "../../../application/ports/out/rental.repository.output.port";
import { PrismaRentalRepositoryAdapter } from "../../../adapters/out/orm/prisma/repositories/prisma-rental.repository.adapter";

container.registerInstance('PrismaClient', new PrismaClient())

container.register<RentalRepositoryOutputPort>(
    'RentalRepositoryOutputPort',
    { useClass: PrismaRentalRepositoryAdapter }
)