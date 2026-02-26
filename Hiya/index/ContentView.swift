//
//  ContentView.swift
//  Hiya
//
//  Created by Swantan Barua on 29/10/25.
//

// MARK: - IMPORTS
import SwiftUI
import FoundationModels

struct ContentView: View {
    
    // MARK: - PROPERTIES
    private var largeLanguageModel = SystemLanguageModel.default
    var session = LanguageModelSession()
    
    @State var response = ""
    @State private var isLoading = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            switch largeLanguageModel.availability {
            case .available:
                if response.isEmpty {
                    if isLoading {
                        ProgressView()
                    } else {
                        ResponseTextView(
                            text: Strings.ContentView.tapToGetFunResponse,
                            foregroundStyle: .tertiary
                        )
                    }
                } else {
                    ResponseTextView(
                        text: response,
                        foregroundStyle: .black
                    )
                    .font(.largeTitle)
                }
                
            case .unavailable(.deviceNotEligible):
                Text(Strings.ContentView.deviceNotEligible)
                
            case .unavailable(.appleIntelligenceNotEnabled):
                Text(Strings.ContentView.enableAppleIntelligence)
                
            case .unavailable(.modelNotReady):
                Text(Strings.ContentView.modelNotReady)
                
            case .unavailable(_):
                Text(Strings.ContentView.aiUnavailableUnknown)
            }
            
            Spacer()
            
            GenerateResponseButton(
                isLoading: $isLoading,
                response: $response,
                session: session
            )
        }
        .padding()
        .tint(.purple)
    }
}

#Preview {
    ContentView()
}
