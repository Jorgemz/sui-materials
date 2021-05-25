//
//  MenuCommands.swift
//  MacMarkDown
//
//  Created by 🤨 on 24/05/21.
//

import SwiftUI

struct MenuCommands: Commands {
  @AppStorage("styleSheet") var styleSheet: StyleSheet = .github
  
  var body: some Commands {
    CommandGroup(before: CommandGroupPlacement.help) {
      Button("Markdown Cheatsheet") {
        showCheatSheet()
      }
      .keyboardShortcut("/", modifiers: .command)
      
      Divider()
    }
    
    CommandMenu("StyleSheet") {
      Button("GitHub") {
        styleSheet = .github
      }
      .keyboardShortcut("1", modifiers: .command)
      
      Button("Lopash") {
        styleSheet = .lopash
      }
      .keyboardShortcut("2", modifiers: .command)
      
      Button("Solarized Dark") {
        styleSheet = .solarizeddark
      }
      .keyboardShortcut("3", modifiers: .command)
      
      Button("Ulysses") {
        styleSheet = .ulysses
      }
      .keyboardShortcut("4", modifiers: .command)
    }
  }
  
  func showCheatSheet() {
    let cheatSheetAddress = "https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet"
    guard let url = URL(string: cheatSheetAddress) else { fatalError("Invalid cheatsheet URL") }
    NSWorkspace.shared.open(url)
  }
}
