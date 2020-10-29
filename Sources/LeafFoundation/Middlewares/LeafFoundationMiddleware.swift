//
//  LeafFoundationMiddleware.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct LeafFoundationMiddleware: Middleware {

    public init() {}

    public func respond(to req: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        do {
            try req.leaf.context.register(generators: req.leafFoundationVariables, toScope: "req")
            try req.leaf.context.register(generators: req.application.leafFoundationVariables, toScope: "app")
        }
        catch {
            return req.eventLoop.makeFailedFuture(error)
        }
        return next.respond(to: req)
    }
}
