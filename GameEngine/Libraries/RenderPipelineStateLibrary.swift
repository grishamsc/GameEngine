//
//  RenderPipelineStateLibrary.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

enum RenderPipelineStateType {
    case basic
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates = [RenderPipelineStateType: RenderPipelineState]()

    public static func initialize() {
        createDefaultRenderPipelineState()
    }

    private static func createDefaultRenderPipelineState() {
        renderPipelineStates[.basic] = BasicRenderPipelineState()
    }

    public static func pipelineState(type: RenderPipelineStateType) -> MTLRenderPipelineState {
        return renderPipelineStates[type]!.renderPipelineState
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

public struct BasicRenderPipelineState: RenderPipelineState {
    var name = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState {
        var renderPipelineState: MTLRenderPipelineState!
        do {
            renderPipelineState = try Engine.device.makeRenderPipelineState(
                descriptor: RenderPipelineDescriptorLibrary.renderPipelineDescriptor(type: .basic)
            )
        } catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(name)_::\(error)")
        }
        return renderPipelineState
    }
}
