//
//  HeaderView.swift
//  Siebtracker
//
//  Created by Tim Hiller on 30.03.22.
//

import SwiftUI

struct HeaderView: View {
    @Binding var headerText : String
    var body: some View {
        Text(headerText).fontWeight(.heavy).font(.headline)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headerText: .constant("Example Header"))
    }
}
