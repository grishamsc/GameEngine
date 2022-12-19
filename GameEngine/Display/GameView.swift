import MetalKit
import simd

class GameView: MTKView {

    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!

    required init(coder: NSCoder) {
        super.init(coder: coder)

        self.device = MTLCreateSystemDefaultDevice()
        Engine.ignite(device: device!)

        self.clearColor = Preferences.clearColor
        self.colorPixelFormat = Preferences.mainPixelFormat

        createVertices()
        createBuffers()
    }
    
    func createVertices() {
        vertices = [
            Vertex(position: simd_float3(0, 1, 0),
                   color: simd_float4(1, 0, 0, 1)),
            Vertex(position: simd_float3(-1, -1, 0),
                   color: simd_float4(0, 1, 0, 1)),
            Vertex(position: simd_float3(1, -1, 0),
                   color: simd_float4(0, 0, 1, 1)),
        ]
    }

    func createBuffers() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices,
                                          length: Vertex.stride(count: vertices.count),
                                          options: [])
    }

    override func draw(_ dirtyRect: NSRect) {
        guard let drawable = self.currentDrawable,
              let renderPassDescriptor = self.currentRenderPassDescriptor
        else {
            return
        }

        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderCommandEncoder?.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(type: .basic))

        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)

        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
