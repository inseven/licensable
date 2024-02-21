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

import Foundation

public struct AnyLicensable: Identifiable, Licensable {

    public let id: String
    public let name: String
    public let author: String
    public let text: String
    public let attributes: [Attribute]
    public var licenses: [Licensable]

    public init<T: Licensable>(_ licensable: T) {
        id = licensable.id
        name = licensable.name
        author = licensable.author
        text = licensable.text
        attributes = licensable.attributes
        licenses = licensable.licenses
    }

}

extension Licensable {

    public func eraseToAnyLicensable() -> AnyLicensable {
        return AnyLicensable(self)
    }

}

extension Array where Element == any Licensable {

    public func eraseToAnyLicensable() -> [AnyLicensable] {
        return map {
            return $0.eraseToAnyLicensable()
        }
    }

}
