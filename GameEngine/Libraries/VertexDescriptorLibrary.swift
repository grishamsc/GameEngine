//
//  VertexDescriptorLibrary.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

enum VertexDescriptorType {
    case basic
}

class VertexDescriptorLibrary {

    private static var vertexDescriptors = [VertexDescriptorType: VertexDescriptor]()

    public static func initialize() {
        createDefaultVertexDescriptors()
    }

    private static func createDefaultVertexDescriptors() {
        vertexDescriptors[.basic] = BasicVertexDescriptor()
    }

    public static func descriptor(type: VertexDescriptorType) -> MTLVertexDescriptor {
        return vertexDescriptors[type]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor { get }
}

public struct BasicVertexDescriptor: VertexDescriptor {
    var name = "Basic Vertex Descriptor"

    var vertexDescriptor: MTLVertexDescriptor {
        let vertexDescriptor = MTLVertexDescriptor()

        // Position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0

        // Color
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = simd_float3.size

        vertexDescriptor.layouts[0].stride = Vertex.stride

        return vertexDescriptor
    }
}
