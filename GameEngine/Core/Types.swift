//
//  Types.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import simd

protocol Sizeable {}

extension Sizeable {
    static var size: Int {
        MemoryLayout<Self>.size
    }

    static var stride: Int {
        MemoryLayout<Self>.stride
    }

    static func size(count: Int) -> Int {
        self.size * count
    }

    static func stride(count: Int) -> Int {
        self.stride * count
    }
}

extension simd_float3: Sizeable {}

struct Vertex: Sizeable {
    let position: simd_float3
    let color: simd_float4
}
