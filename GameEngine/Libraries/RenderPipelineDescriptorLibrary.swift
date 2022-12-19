//
//  RenderPipelineDescriptorLibrary.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

enum RenderPipelineDescriptorType {
    case basic
}

class RenderPipelineDescriptorLibrary {
    private static var renderPipelineDescriptors = [RenderPipelineDescriptorType: RenderPipelineDescriptor]()

    public static func initialize() {
        createDefaultRenderPipelineDescriptors()
    }

    private static func createDefaultRenderPipelineDescriptors() {
        renderPipelineDescriptors[.basic] = BasicRenderPipelineDescriptor()
    }

    public static func renderPipelineDescriptor(type: RenderPipelineDescriptorType) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[type]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

public struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    var name = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()

        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.mainPixelFormat
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.vertex(type: .basic)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.fragment(type: .basic)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(type: .basic)

        return renderPipelineDescriptor
    }
}
