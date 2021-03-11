//
//  Request+TauFoundation.swift
//  TauFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 21..
//

public extension Request {

    var tauFoundationVariables: [String: TemplateDataGenerator] {
        [
            "url": .lazy([
                        "isSecure": TemplateData.bool(self.url.scheme?.contains("https")),
                        "host": TemplateData.string(self.url.host),
                        "port": TemplateData.int(self.url.port),
                        "path": TemplateData.string(self.url.path),
                        "query": TemplateData.string(self.url.query)
                    ]),
        ]
    }
}
