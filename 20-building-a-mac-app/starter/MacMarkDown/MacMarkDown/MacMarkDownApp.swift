//
//  MacMarkDownApp.swift
//  MacMarkDown
//
//  Created by 🤨 on 24/05/21.
//

import SwiftUI

@main
struct MacMarkDownApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MacMarkDownDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
