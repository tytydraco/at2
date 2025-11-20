//
//  ContentView.swift
//  rive_sample_empty
//
//  Created by Tyler Nijmeh (Work) on 11/4/25.
//

import SwiftUI
import RiveRuntime

struct AnimationView: View {
    let riveViewModel = RiveViewModel(fileName: "input", fit: .layout)

    var body: some View {
        riveViewModel.view()
            .onAppear {
                riveViewModel.layoutScaleFactor = 4
                riveViewModel.riveModel?.enableAutoBind { instance in
                    // //instance.stringProperty(fromPath: "text")!.value = "ح ج ع خ ج"
                    // // Set text run value after instance is ready
                    // DispatchQueue.main.async {
                    //     // Try different possible text run name formats
                    //     let textRunNames = ["text", "Text/text", "Text text"]
                    //     var success = false
                        
                    //     for name in textRunNames {
                    //         do {
                    //             try riveViewModel.setTextRunValue(name, textValue: "ح ج ع خ ج")
                    //             print("Successfully set text run '\(name)'")
                    //             success = true
                    //             break
                    //         } catch {
                    //             // Try next name
                    //         }
                    //     }
                        
                    //     if !success {
                    //         print("Failed to set text run. Make sure 'Run 1' has an Export Name set in Rive.")
                    //     }
                    // }
                }

                do {
                    try riveViewModel.setTextRunValue("label_run", path: "label_artboard_01", textValue: "س")
                    try riveViewModel.setTextRunValue("label_run", path: "label_artboard_02", textValue: "ج")
                    try riveViewModel.setTextRunValue("label_run", path: "label_artboard_03", textValue: "خ")
                    try riveViewModel.setTextRunValue("label_run", path: "label_artboard_04", textValue: "ع")
                    try riveViewModel.setTextRunValue("label_run", path: "label_artboard_05", textValue: "ج")
                    try riveViewModel.setTextRunValue("label_run", path: "label_artboard_06", textValue: "ح")
                    try riveViewModel.setTextRunValue("label_run", path: "label_artboard_07", textValue: "س")
                } catch {
                    print("Error setting text run value: \(error)")
                }

                RiveFont.fallbackFontsCallback = { style in
                    return []
                    switch style.weight {
                    case .thin: return [
                            UIFont.systemFont(ofSize: 50, weight: .thin)
                        ]
                    case .bold: return [
                            UIFont.systemFont(ofSize: 50, weight: .bold)
                        ]
                    default: return [
                            UIFont.systemFont(ofSize: 20)
                        ]
                    }
                }
            }
    }
}

#Preview {
    AnimationView()
}
