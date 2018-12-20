//
//  MLBootstrapSpec.swift
//  MLBootstrap
//
//  Created by Michel Lutz on 04/10/16.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import Quick
import Nimble
@testable import MLBootstrap

class MLBootstrapSpec: QuickSpec {

    override func spec() {

        describe("MLBootstrapSpec") {
            it("works") {
                expect(MLBootstrap.name) == "MLBootstrap"
            }
        }

    }

}
