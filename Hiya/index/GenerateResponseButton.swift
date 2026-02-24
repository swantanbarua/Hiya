//
//  GenerateResponseButton.swift
//  Hiya
//
//  Created by Swantan Barua on 24/02/26.
//

// MARK: - IMPORTS
import SwiftUI
import FoundationModels

struct GenerateResponseButton: View {
    
    // MARK: - PROPERTIES
    @Binding var isLoading: Bool
    @Binding var response: String
    var session: LanguageModelSession
    
    // MARK: - BODY
    var body: some View {
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
}

#Preview {
    GenerateResponseButton(
        isLoading: .constant(false),
        response: .constant(""),
        session: LanguageModelSession()
    )
}
