// MIT License
//
// Copyright (c) 2024 Jason Morley
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import XCTest
@testable import Licensable

extension URL {

    static let interact: URL = URL(string: "https://github.com/inseven/interact")!

}

extension License {

    static var interact: License {
        return .init(id: "https://github.com/inseven/interact",
                     name: "Interact",
                     author: "Jason Morley",
                     text: "MIT License",
                     attributes: [
                        .url(.interact, title: "URL")
                     ])
    }

}

final class LicensableTests: XCTestCase {

    func testSimpleLicense() {
        let license = License.interact
        XCTAssertEqual(license.id, "https://github.com/inseven/interact")
        XCTAssertEqual(license.name, "Interact")
        XCTAssertEqual(license.author, "Jason Morley")
        XCTAssertEqual(license.text, "MIT License")
        XCTAssertEqual(license.attributes.map({ $0.stringValue }), ["https://github.com/inseven/interact"])
    }

}
