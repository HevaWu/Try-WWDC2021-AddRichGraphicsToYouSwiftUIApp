/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The particle visualizer.
*/

import SwiftUI

struct ParticleVisualizer: View {
    var gradients: [Gradient]
    @StateObject private var model = ParticleModel()

    var body: some View {
        Canvas {
            
        }
    }
}

struct ParticleView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleVisualizer(gradients: [])
            .preferredColorScheme(.dark)
    }
}
