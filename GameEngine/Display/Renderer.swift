//
//  Renderer.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

class Renderer: NSObject {
    var gameObject = GameObject()
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {

    }

    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor
        else {
            return
        }

        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)

        gameObject.render(renderCommandEncoder: renderCommandEncoder!)

        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
