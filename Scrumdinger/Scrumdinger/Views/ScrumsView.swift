//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 04/11/23.
//

import SwiftUI

struct ScrumsView: View { //rappresenta la vista principale dell'applicazione.
    @Binding var scrums: [DailyScrum]
    @State var isPresentingNewScrumView: Bool = false
    
    var body: some View {
        NavigationStack {
            List($scrums) { $element in
                NavigationLink(destination: DetailView(scrum: $element)) {
                    //Text(row.title)
                    CardView(scrum: element)
                }
                .listRowBackground(element.themeColor.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar{
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationStack {
                NewScrumSheet()
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    
    static var scrumss = DailyScrum.scrumData
    
    static var previews: some View { //restituisce una o più anteprime della VIEW principale
        
        ScrumsView(scrums: .constant(scrumss))
        // (.constant) crea variabili con un valore costante che non cambia durante il ciclo di vita della vista
    }
}
