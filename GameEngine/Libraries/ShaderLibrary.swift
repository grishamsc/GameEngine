//
//  ShaderLibrary.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

enum VertexShaderType {
    case basic
}

enum FragmentShaderType {
    case basic
}

class ShaderLibrary {
    public static var defaultLibrary: MTLLibrary!

    private static var vertexShaders = [VertexShaderType: Shader]()
    private static var fragmentShaders = [FragmentShaderType: Shader]()

    public static func initialize() {
        defaultLibrary = Engine.device.makeDefaultLibrary()
        createDefaultShaders()
    }

    public static func createDefaultShaders() {
        vertexShaders[.basic] = BasicVertexShader()
        fragmentShaders[.basic] = BasicFragmentShader()
    }

    public static func vertex(type: VertexShaderType) -> MTLFunction {
        return vertexShaders[type]!.function
    }

    public static func fragment(type: FragmentShaderType) -> MTLFunction {
        return fragmentShaders[type]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction { get }
}

public struct BasicVertexShader: Shader {
    public var name = "Basic Vertex Shader"
    public var functionName = "basic_vertex_shader"
    public var function: MTLFunction {
        let function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}

public struct BasicFragmentShader: Shader {
    public var name = "Basic Fragment Shader"
    public var functionName = "basic_fragment_shader"
    public var function: MTLFunction {
        let function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}
