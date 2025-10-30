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
    private var session = LanguageModelSession()
    @State private var response = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            switch largeLanguageModel.availability {
            case .available:
                Text(response)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
                
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
                Task {
                    let prompt = "Say Hi in a fun way"
                    
                    do {
                        let replay = try await session.respond(to: prompt)
                        response = replay.content
                    } catch {
                        response = "Failed to get response : \(error.localizedDescription)"
                    }
                }
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
        .tint(.purple)
    }
}

#Preview {
    ContentView()
}
