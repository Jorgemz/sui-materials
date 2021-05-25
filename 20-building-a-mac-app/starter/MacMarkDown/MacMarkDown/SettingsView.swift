//
//   SettingsView..swift
//  MacMarkDown
//
//  Created by 🤨 on 24/05/21.
//

import SwiftUI

struct SettingsView: View {
  
  @AppStorage("editorFontSize") var editorFontSize: Int = 14
  
  var body: some View {
    Stepper(value: $editorFontSize, in: 10 ... 30) {
      Text("Font size: \(editorFontSize)")
    }
    .frame(width: 200, height: 80)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
