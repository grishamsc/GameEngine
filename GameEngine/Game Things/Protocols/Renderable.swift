//
//  Renderable.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

protocol Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder)
}
