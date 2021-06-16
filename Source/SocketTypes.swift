//
//  SocketTypes.swift
//  Socket.IO-Client-Swift
//
//  Created by Erik Little on 4/8/15.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// A marking protocol that says a type can be represented in a socket.io packet.
///
/// Example:
///
/// ```swift
/// struct CustomData : SocketData {
///    let name: String
///    let age: Int
///
///    func socketRepresentation() -> SocketData {
///        return ["name": name, "age": age]
///    }
/// }
///
/// socket.emit("myEvent", CustomData(name: "Erik", age: 24))
/// ```
public protocol SocketDataLegacy {
    // MARK: Methods

    /// A representation of self that can sent over socket.io.
    func socketRepresentation() throws -> SocketDataLegacy
}

public extension SocketDataLegacy {
    /// Default implementation. Only works for native Swift types and a few Foundation types.
    func socketRepresentation() -> SocketDataLegacy {
        return self
    }
}

extension Array : SocketDataLegacy { }
extension Bool : SocketDataLegacy { }
extension Dictionary : SocketDataLegacy { }
extension Double : SocketDataLegacy { }
extension Int : SocketDataLegacy { }
extension NSArray : SocketDataLegacy { }
extension Data : SocketDataLegacy { }
extension NSData : SocketDataLegacy { }
extension NSDictionary : SocketDataLegacy { }
extension NSString : SocketDataLegacy { }
extension NSNull : SocketDataLegacy { }
extension String : SocketDataLegacy { }

/// A typealias for an ack callback.
public typealias AckCallbackLegacy = ([Any]) -> Void

/// A typealias for a normal callback.
public typealias NormalCallbackLegacy = ([Any], SocketAckEmitterLegacy) -> Void

typealias JSON = [String: Any]
typealias Probe = (msg: String, type: SocketEnginePacketTypeLegacy, data: [Data])
typealias ProbeWaitQueue = [Probe]

enum Either<E, V> {
    case left(E)
    case right(V)
}
