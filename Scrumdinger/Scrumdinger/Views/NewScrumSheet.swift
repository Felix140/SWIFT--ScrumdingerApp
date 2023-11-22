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
    @Binding var addScrum: [DailyScrum]
    
    var body: some View {
        DetailEditView(scrum: $newScrum)
            .toolbar { /// aggiunge i bottoni di edit dello .sheet (modale)
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        isPresentingNewScrumView = false /// si chiude la modale
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        addScrum.append(newScrum)
                        isPresentingNewScrumView = false /// si chiude la modale
                    }
                }
            }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(isPresentingNewScrumView: .constant(true), addScrum: .constant(DailyScrum.scrumData))
    }
}
