//
//  Preferences.swift
//  GameEngine
//
//  Created by Grigory Serebryaniy on 19.12.2022.
//

import MetalKit

enum ClearColors {
    static let white: MTLClearColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
    static let green: MTLClearColor = .init(red: 0.22, green: 0.55, blue: 0.34, alpha: 1)
    static let gray: MTLClearColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    static let black: MTLClearColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
}

class Preferences {
    public static var clearColor: MTLClearColor = ClearColors.green

    public static var mainPixelFormat: MTLPixelFormat = .bgra8Unorm

    private init() {}
}
