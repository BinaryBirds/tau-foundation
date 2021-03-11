//
//  TemplateEngine+TauFoundation.swift
//  TauFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public extension TemplateEngine {

    static func useTauFoundation() {
        entities.use(RequestParameter(), asFunction: "Request")
        entities.use(RequestQuery(), asFunction: "Request")
        entities.use(RequestSetQuery(), asFunction: "Request")

        entities.use(SortIndicator(), asFunction: "SortIndicator")
        entities.use(SortQuery(), asFunction: "SortQuery")

        entities.use(TrimLast(), asMethod: "trimLast")
    }
}
