/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The particle visualizer.
 */

import SwiftUI

struct ParticleVisualizer: View {
    var gradients: [Gradient]
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let now = timeline.date
                    .timeIntervalSinceReferenceDate
                let angle = Angle.degrees(now.remainder(dividingBy: 3) * 120)
                let x = cos(angle.radians)
                var image = context.resolve(Image(systemName: "sparkle"))
                image.shading = .color(.blue)
                let imageSize = image.size
                
                // blendMode combine color
                context.blendMode = .screen
                for i in 0..<10 {
                    let frame = CGRect(
                        x: 0.5 * size.width + Double(i) * imageSize.width * x,
                        y: 0.5 * size.height,
                        width: imageSize.width,
                        height: imageSize.height
                    )
                    
                    var innerContext = context
                    innerContext.opacity = 0.5
                    innerContext.fill(Ellipse().path(in: frame), with: .color(.cyan))
                    context.draw(image, in: frame)
                }
            }
        }
    }
}

struct ParticleView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleVisualizer(gradients: [])
            .preferredColorScheme(.dark)
    }
}
