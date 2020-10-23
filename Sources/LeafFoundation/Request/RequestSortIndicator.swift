//
//  RequestSortIndicator.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct RequestSortIndicator: LeafUnsafeEntity, LeafNonMutatingMethod, StringReturn {
    public var unsafeObjects: UnsafeObjects? = nil
    
    public static var callSignature: [LeafCallParameter] {
        [.string, .init(label: "default", types: .bool, optional: true, defaultValue: .bool(false))]
    }
    
    public func evaluate(_ params: LeafCallValues) -> LeafData {
        guard let req = req else { return .error("Needs unsafe access to Request") }
        let key = params[0].string!
        let isDefaultSort = params[1].bool!

        let isAscendingOrder = (req.query["order"] ?? "asc") == "asc"
        let sort: String? = req.query["sort"]
        let arrow = isAscendingOrder ? "▴" : "▾"

        if (sort == nil && isDefaultSort) || key == sort {
            return .string("\(arrow)")
        }
        return .string("")

    }
}
