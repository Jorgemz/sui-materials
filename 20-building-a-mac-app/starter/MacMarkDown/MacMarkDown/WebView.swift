//
//  WebView.swift
//  MacMarkDown
//
//  Created by 🤨 on 24/05/21.
//

import SwiftUI
import WebKit

final class WebView: NSViewRepresentable {
  var html: String
  
  init(html: String) {
    self.html = html
  }
  
  func makeNSView(context: Context) -> WKWebView {
    let webView = WKWebView()
    return webView
  }
  
  func updateNSView(_ nsView: WKWebView, context: Context) {
    nsView.loadHTMLString(html, baseURL: Bundle.main.resourceURL)
  }
}
