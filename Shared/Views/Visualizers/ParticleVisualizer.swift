/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The particle visualizer.
*/

import SwiftUI

struct ParticleVisualizer: View {
    var gradients: [Gradient]

    var body: some View {
        Canvas { context, size in
            let image = Image(systemName: "sparkle")
            context.draw(image, at: CGPoint(x: 0.5 * size.width, y: 0.5 * size.height))
        }
    }
}

struct ParticleView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleVisualizer(gradients: [])
            .preferredColorScheme(.dark)
    }
}
