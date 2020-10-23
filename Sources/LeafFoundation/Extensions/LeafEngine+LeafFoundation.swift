//
//  LeafEngine+LeafFoundation.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

import Leaf

public extension LeafEngine {

    static func useLeafFoundation() {
        entities.use(RequestParameter(), asFunction: "Request")
        entities.use(RequestPathDropLast(), asFunction: "Request")
        entities.use(RequestQuery(), asFunction: "Request")
        entities.use(RequestSetQuery(), asFunction: "Request")
        entities.use(RequestSortIndicator(), asFunction: "Request")
        entities.use(RequestSortQuery(), asFunction: "Request")
    }
}
