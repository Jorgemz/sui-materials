//
//  WebView.swift
//  MacMarkDown
//
//  Created by 🤨 on 24/05/21.
//

import SwiftUI
import WebKit

final class WebView: NSViewRepresentable {
  @AppStorage("styleSheet") var styleSheet: StyleSheet = .ulysses

  var html: String
  
  var formattedHtml: String {
    return """
      <html>
      <head>
        <link href="\(styleSheet).css" rel="stylesheet">
      </head>
      <body>
        \(html)
      </body>
      </html>
      """
  }
  
  init(html: String) {
    self.html = html
  }
  
  func makeNSView(context: Context) -> WKWebView {
    let webView = WKWebView()
    return webView
  }
  
  func updateNSView(_ nsView: WKWebView, context: Context) {
    nsView.loadHTMLString(formattedHtml, baseURL: Bundle.main.resourceURL)
  }
}
