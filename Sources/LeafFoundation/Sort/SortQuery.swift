//
//  SortQuery.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct SortQuery: LeafUnsafeEntity, StringReturn {

    public var unsafeObjects: UnsafeObjects? = nil
    
    public static var callSignature: [LeafCallParameter] {
        [
            /// field key
            .init(label: "for", types: [.string]),
            .init(label: "default", types: .bool, optional: true, defaultValue: .bool(false)),
        ]
    }
    
    public func evaluate(_ params: LeafCallValues) -> LeafData {
        guard let req = req else { return .error("Needs unsafe access to Request") }
        /// we split the query items and store them in a dictionary
        var queryItems = req.queryDictionary
        /// we check the old order and sort values
        let oldOrder = queryItems["order"]
        let oldSort = queryItems["sort"]
        /// we update the order based on the input
        let fieldKey = params[0].string!
        queryItems["order"] = fieldKey
        
        let isDefaultOrder = params[1].bool!
        /// if there was no old order and this is the default order that means we have to use desc
        if oldOrder == nil && isDefaultOrder {
            queryItems["sort"] = "desc"
        }
        /// if the old order was equal with the field key we just flip the sort
        else if oldOrder == fieldKey {
            /// if there was an ascending sorting or the order was not existing
            if oldSort == "asc" || oldSort == nil {
                queryItems["sort"] = "desc"
            }
            /// if the sort was descending we explicitly set it to asc
            if oldSort == "desc" {
                queryItems["sort"] = "asc"
            }
        }
        /// otherwise this is a completely new order we can remove the sort key completely
        else {
            queryItems.removeValue(forKey: "sort")
        }
        return .string("\(req.url.path)?\(queryItems.queryString)")
    }
}
