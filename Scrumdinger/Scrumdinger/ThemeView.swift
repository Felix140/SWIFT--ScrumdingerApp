//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 10/11/23.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.nameColor)
            .padding() // Aggiungo auto padding
            .frame(maxWidth: .infinity) // aggiungo la width a 100%
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 10)) // border radius
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .butterCup)
    }
}
