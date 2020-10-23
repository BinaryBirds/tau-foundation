//
//  RequestPathDropLast.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct RequestPathDropLast: LeafUnsafeEntity, StringReturn {
    public var unsafeObjects: UnsafeObjects? = nil
    
    public static var callSignature: [LeafCallParameter] { [.int(labeled: "pathDropLast")] }
    
    public func evaluate(_ params: LeafCallValues) -> LeafData {
        guard let req = req else { return .error("Needs unsafe access to Request") }
        let n = max(1, params[0].int!)
        let value = req.url.path
        let path = value.split(separator: "/").dropLast(n).joined(separator: "/")
        return .string("/" + path + "/")
    }
}
