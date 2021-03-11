//
//  TauFoundationMiddleware.swift
//  TauFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct TauFoundationMiddleware: Middleware {

    public init() {}

    public func respond(to req: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        do {
            try req.tau.context.register(generators: req.tauFoundationVariables, toScope: "req")
            try req.tau.context.register(generators: req.application.tauFoundationVariables, toScope: "app")
        }
        catch {
            return req.eventLoop.makeFailedFuture(error)
        }
        return next.respond(to: req)
    }
}
