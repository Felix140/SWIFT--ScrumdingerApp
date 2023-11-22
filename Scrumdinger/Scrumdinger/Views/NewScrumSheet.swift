//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 22/11/23.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        DetailEditView(scrum: $newScrum)
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(isPresentingNewScrumView: .constant(true))
    }
}
