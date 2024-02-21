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

public struct Attribute: Identifiable, Equatable {

    public enum Value: Equatable {
        case text(String)
        case url(URL)
    }

    public let id = UUID()
    public let name: String
    public let value: Value

    public var stringValue: String {
        switch self.value {
        case .text(let text):
            return text
        case .url(let url):
            return url.absoluteString
        }
    }

}

extension Attribute {

    public static func url(_ url: URL, title: String) -> Attribute {
        return Self.init(name: title, value: .url(url))
    }

    public static func text(_ text: String, title: String) -> Attribute {
        return Self.init(name: title, value: .text(text))
    }

}
