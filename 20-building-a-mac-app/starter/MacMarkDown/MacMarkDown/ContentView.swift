//
//  ContentView.swift
//  MacMarkDown
//
//  Created by 🤨 on 24/05/21.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("editorFontSize") var editorFontSize: Int = 14
  @AppStorage("styleSheet") var styleSheet: StyleSheet = .github
  @Binding var document: MacMarkDownDocument
  
  var body: some View {
    HSplitView {
      TextEditor(text: $document.text).frame(minWidth: 200).font(.system(size: CGFloat(editorFontSize)))
      WebView(html: document.html).frame(minWidth: 200)
        .onChange(of: styleSheet) { _ in
          document.refreshHtml()
        }
    }
    .frame(minWidth: 400, idealWidth: 600, maxWidth: .infinity,
           minHeight: 300, idealHeight: 400, maxHeight: .infinity)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(document: .constant(MacMarkDownDocument()))
  }
}
