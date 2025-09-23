import 'reflect-metadata'
import { container } from "tsyringe";

import "./infra/di/config/repositories";
import "./infra/di/config/services";
import "./infra/di/config/controllers";
import "./infra/di/config/routes";
import "./infra/di/config/server";

import { HttpServerInputPort } from './application/ports/in/http-server.input.port';

const server = container.resolve<HttpServerInputPort>('HttpServerInputPort')

server.listen()