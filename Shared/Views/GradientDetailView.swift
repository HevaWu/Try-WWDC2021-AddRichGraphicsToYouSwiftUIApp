/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The gradient detail view.
*/

import SwiftUI

struct GradientDetailView: View {
    @Binding var gradient: GradientModel
    @State private var isEditing = false
    @State private var selectedStopID: Int?

    var body: some View {
        // Stack on top of each other
        ZStack(alignment: .bottom) {
            VStack {
                if !isEditing {
                    LinearGradient(gradient: gradient.gradient, startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea(edges: .bottom)
                } else {
                    GradientControl(gradient: $gradient, selectedStopID: $selectedStopID)
                        .padding()

                    if let selectedStopID = selectedStopID {
                        SystemColorList(color: $gradient[stopID: selectedStopID].color) {
                            gradient.remove(selectedStopID)
                            self.selectedStopID = nil
                        }
                    } else {
                        SystemColorList.Empty()
                    }
                }
            }
            
            HStack {
                if isEditing {
                    TextField("Name", text: $gradient.name)
                } else {
                    gradient.name.isEmpty ? Text("New Gradient") : Text(gradient.name)
                }
                
                Spacer()
                
                Text("\(gradient.stops.count) \(Text("colors").foregroundColor(.red))")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(.thinMaterial)
        }
        .toolbar {
            Button(isEditing ? "Done" : "Edit") {
                isEditing.toggle()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var gradientBackground: some View {
        LinearGradient(gradient: gradient.gradient, startPoint: .leading, endPoint: .trailing)
            .ignoresSafeArea(edges: .bottom)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GradientDetailView(
                gradient: .constant(GradientModel(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple])))
                
        }
    }
}
