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
        entities.use(RequestQuery(), asFunction: "Request")
        entities.use(RequestSetQuery(), asFunction: "Request")

        entities.use(SortIndicator(), asFunction: "SortIndicator")
        entities.use(SortQuery(), asFunction: "SortQuery")

        entities.use(TrimLast(), asMethod: "trimLast")
    }
}
