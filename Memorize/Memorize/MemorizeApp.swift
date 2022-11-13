//
//  MemorizeApp.swift
//  Memorize
//
//  Created by x2mobile on 12.11.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemorizeGame())
        }
    }
}
