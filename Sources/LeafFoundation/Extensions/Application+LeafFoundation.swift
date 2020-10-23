//
//  Application+LeafFoundation.swift
//  LeafFoundation
//
//  Created by Tibor Bodecs on 2020. 10. 23..
//

public extension Application {

    var leafFoundationVariables: [String: LeafDataGenerator] {
        [
            "isDebug": .lazy(LeafData.bool(!self.environment.isRelease && self.environment != .production))
        ]
    }
}
