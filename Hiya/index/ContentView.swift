//
//  ContentView.swift
//  Hiya
//
//  Created by Swantan Barua on 29/10/25.
//

// MARK: - IMPORTS
import SwiftUI
import FoundationModels
import Foundation

struct ContentView: View {
    
    // MARK: - PROPERTIES
    private var largeLanguageModel = SystemLanguageModel.default
    private var session = LanguageModelSession()
    
    @State private var response = ""
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
                        Text(Strings.ContentView.tapToGetFunResponse)
                            .foregroundStyle(.tertiary)
                            .multilineTextAlignment(.center)
                            .font(.title)
                    }
                } else {
                    Text(response)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .bold()
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
            
            Button {
                Task {
                    isLoading = true
                    
                    defer { isLoading = false }
                    
                    let prompt = Strings.ContentView.sayHiPrompt
                    
                    do {
                        let replay = try await session.respond(to: prompt)
                        response = replay.content
                    } catch {
                        response = Strings.ContentView.failedToGetResponsePrefix + error.localizedDescription
                    }
                }
            } label: {
                Text(Strings.ContentView.welcomeButtonTitle)
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
