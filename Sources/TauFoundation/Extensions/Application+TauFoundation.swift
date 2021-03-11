//
//  Application+TauFoundation.swift
//  TauFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public extension Application {

    var tauFoundationVariables: [String: TemplateDataGenerator] {
        [
            "isDebug": .lazy(TemplateData.bool(!self.environment.isRelease && self.environment != .production))
        ]
    }
}
