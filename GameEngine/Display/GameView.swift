import MetalKit
import simd

class GameView: MTKView {

    var renderer: Renderer!

    required init(coder: NSCoder) {
        super.init(coder: coder)

        self.device = MTLCreateSystemDefaultDevice()
        Engine.ignite(device: device!)

        self.clearColor = Preferences.clearColor
        self.colorPixelFormat = Preferences.mainPixelFormat

        self.renderer = Renderer()
        self.delegate = renderer
    }
}
