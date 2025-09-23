import { NextFunction, Request, Response } from "express";
import { APIError } from "../../../../../../infra/http/helpers/APIError";

export const errorHandler = (
    err: Partial<APIError>,
    req: Request, 
    res: Response,
    next: NextFunction) => {
    return err instanceof APIError ?
        res.status(err.statusCode).json({
            name: err.name,
            message: err.message
        })
        :
        res.status(500).json({
            name: err.name,
            message: 'Internal Server Error'
        });
}