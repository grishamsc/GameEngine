//
//  GameObject.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

class GameObject: Node {

    var modelConstants = ModelConstants()
    var mesh: Mesh

    init(meshType: MeshType) {
        mesh = MeshLibrary.mesh(type: meshType)
    }

    var time: Float = 0
    func update(deltaTime: Float) {
        time += deltaTime

        position.x = cos(time)
        position.y = sin(time)
        scale = simd_float3(repeating: cos(time))
        rotation.z = cos(time)

        updateModalConstants()
    }

    private func updateModalConstants() {
        modelConstants.modelMatrix = modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(type: .basic))
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 1)
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}

