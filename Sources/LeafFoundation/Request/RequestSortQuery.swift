//
//  RequestSortQuery.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public struct RequestSortQuery: LeafUnsafeEntity, StringReturn {
    public var unsafeObjects: UnsafeObjects? = nil
    
    public static var callSignature: [LeafCallParameter] { [.init(label: "sortQuery", types: [.dictionary])] }
    
    public func evaluate(_ params: LeafCallValues) -> LeafData {
        guard let req = req else { return .error("Needs unsafe access to Request") }

        var queryItems: [String: String] = [:]
        for item in (req.url.query ?? "").split(separator: "&") {
            let array = item.split(separator: "=")
            guard array.count == 2 else {
                continue
            }
            let k = String(array[0])
            let v = String(array[1])
            queryItems[k] = v
        }
        
        let oldSort = queryItems["sort"]
        let oldOrder = queryItems["order"]
        queryItems["sort"] = params[0].string!
        
        if oldSort != params[0].string {
            if oldOrder == "desc" {
                queryItems["order"] = "asc"
            }
        }
        else {
            if oldOrder == "desc" {
                queryItems["order"] = "asc"
            }
            if oldOrder == nil || oldOrder == "asc" {
                queryItems["order"] = "desc"
            }
        }
        
        let queryString = queryItems.map { $0 + "=" + $1 }.joined(separator: "&")
        return .string("\(req.url.path)?\(queryString)")
    }
}
