//
//  ContentView.swift
//  Hiya
//
//  Created by Swantan Barua on 29/10/25.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    
    private var largeLanguageModel = SystemLanguageModel.default
    
    // MARK: - BODY
    var body: some View {
        VStack {
            switch largeLanguageModel.availability {
            case .available:
                Text("Available")
                
            case .unavailable:
                Text("Unavailable")
            }
        }
    }
}

#Preview {
    ContentView()
}
