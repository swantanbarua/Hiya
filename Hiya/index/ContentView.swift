//
//  ContentView.swift
//  Hiya
//
//  Created by Swantan Barua on 29/10/25.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    
    // MARK: - PROPERTIES
    private var largeLanguageModel = SystemLanguageModel.default
    @State private var response = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            switch largeLanguageModel.availability {
            case .available:
                Text("Available")
                
            case .unavailable(.deviceNotEligible):
                Text("Your device isn't eligible for Apple Intelligence")
                
            case .unavailable(.appleIntelligenceNotEnabled):
                Text("Please enable Apple Intelligence in Settings")
                
            case .unavailable(.modelNotReady):
                Text("The AI model is not ready")
                
            case .unavailable(_):
                Text("The AI feature is unavailable for an unknown reason")
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .glassEffect(.regular.interactive())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
