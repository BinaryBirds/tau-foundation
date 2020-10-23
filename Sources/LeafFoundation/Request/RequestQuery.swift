//
//  RequestQuery.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct RequestQuery: LeafUnsafeEntity, StringReturn {
    public var unsafeObjects: UnsafeObjects? = nil
    
    public static var callSignature: [LeafCallParameter] { [.string(labeled: "query")] }
    
    public func evaluate(_ params: LeafCallValues) -> LeafData {
        guard let req = req else { return .error("Needs unsafe access to Request") }
        return .string(req.query[params[0].string!])
    }
}
