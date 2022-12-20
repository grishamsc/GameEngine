//
//  MeshLibrary.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

enum MeshType {
    case triangleCustom
    case quadCustom
}

class MeshLibrary {
    private static var meshes = [MeshType: Mesh]()

    public static func initialize() {
        createDefaultMeshes()
    }

    private static func createDefaultMeshes() {
        meshes[.triangleCustom] = TriangleCustomMesh()
        meshes[.quadCustom] = QuadCustomMesh()
    }

    public static func mesh(type: MeshType) -> Mesh {
        return meshes[type]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }

    init() {
        createVertices()
        createBuffers()
    }

    func createVertices() { }

    func createBuffers() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices,
                                                length: Vertex.stride(count: vertices.count),
                                                options: [])
    }
}

class TriangleCustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: simd_float3(0, 1, 0), color: simd_float4(1, 0, 0, 1)),
            Vertex(position: simd_float3(-1, -1, 0), color: simd_float4(0, 1, 0, 1)),
            Vertex(position: simd_float3(1, -1, 0), color: simd_float4(0, 0, 1, 1)),
        ]
    }
}

class QuadCustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: simd_float3(1, 1, 0), color: simd_float4(1, 0, 0, 1)),   // top right
            Vertex(position: simd_float3(-1, 1, 0), color: simd_float4(0, 1, 0, 1)), // top left
            Vertex(position: simd_float3(-1, -1, 0), color: simd_float4(0, 0, 1, 1)),  // bottom left

            Vertex(position: simd_float3(1, 1, 0), color: simd_float4(1, 0, 0, 1)),   // top right
            Vertex(position: simd_float3(-1, -1, 0), color: simd_float4(0, 0, 1, 1)), // bottom left
            Vertex(position: simd_float3(1, -1, 0), color: simd_float4(1, 0, 1, 1))   // bottom right
        ]
    }
}
