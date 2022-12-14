//
//  Node.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

class Node {

    var position: simd_float3 = simd_float3(repeating: 0)
    var scale: simd_float3 = simd_float3(repeating: 1)
    var rotation: simd_float3 = simd_float3(repeating: 0)

    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: position)
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        modelMatrix.scale(axis: scale)

        return modelMatrix
    }

    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
