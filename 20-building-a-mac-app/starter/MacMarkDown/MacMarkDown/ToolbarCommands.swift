//
//  ToolbarCommands.swift
//  MacMarkDown
//
//  Created by 🤨 on 24/05/21.
//

import SwiftUI

enum PreviewState {
  case hidden
  case html
  case web
}

struct PreviewToolBarItem: ToolbarContent {
  @Binding var previewState: PreviewState

  var body: some ToolbarContent {
    ToolbarItem {
      Picker("", selection: $previewState) {
        Image(systemName: "eye.slash")
          .tag(PreviewState.hidden)
        Image(systemName: "doc.plaintext")
          .tag(PreviewState.html)
        Image(systemName: "doc.richtext")
          .tag(PreviewState.web)
      }
      .pickerStyle(SegmentedPickerStyle())
      .help("Hide preview, show HTML or web view")
    }
  }
}
