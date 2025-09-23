import { container } from "tsyringe";
import { Router } from "express";
import { ExpressAdapter } from "../../../adapters/in/http/frameworks/express/server";

const routes = container.resolve<Router>("Routes");

container.register(
    "Routes",
    { useValue: routes }
);

container.register(
    "HttpServerInputPort",
    { useClass: ExpressAdapter }
);