//
//  Request+LeafFoundation.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 21..
//

public extension Request {

    var leafFoundationVariables: [String: LeafDataGenerator] {
        [
            "url": .lazy([
                        "isSecure": LeafData.bool(self.url.scheme?.contains("https")),
                        "host": LeafData.string(self.url.host),
                        "port": LeafData.int(self.url.port),
                        "path": LeafData.string(self.url.path),
                        "query": LeafData.string(self.url.query)
                    ]),
        ]
    }
}
