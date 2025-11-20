import SwiftUI
import RiveRuntime

struct AnimationView: View {
    let riveViewModel = RiveViewModel(fileName: "input", fit: .layout)

    var body: some View {
        riveViewModel.view()
            .onAppear {
                riveViewModel.layoutScaleFactor = 1
                riveViewModel.riveModel?.enableAutoBind { instance in
                    
                }
            }
    }
}

#Preview {
    AnimationView()
}
