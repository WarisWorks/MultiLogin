//
//  CustomField.swift
//  MultiLogin
//
//  Created by Waris Ruzi on 2022/08/22.
//

import SwiftUI

struct CustomField: View {
    var hint: String
    @Binding var text: String

    
    //MARK: View Properties
    @FocusState var isEnabled: Bool
    var contentType: UITextContentType = .telephoneNumber
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField(hint, text: $text)
                .keyboardType(.numberPad)
                .textContentType(contentType)
                .focused($isEnabled)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.black.opacity(0.2))
                
                Rectangle()
                    .fill(.black)
                    .frame(width: isEnabled ? nil : 0, alignment: .leading)
                    .animation(.easeInOut(duration: 0.3), value: isEnabled)
            }
            .frame(height: 2)
        }
    }
}

struct CustomField_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
