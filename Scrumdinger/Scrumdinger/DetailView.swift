//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 07/11/23.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    @State private var onShowEditView: Bool = false
    
    var body: some View {
        List {
            // INFORMAZIONI
            Section(header: Text("Informazioni")) {
//                Start Meeting
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
//                Length
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine) // combine the Label and Text elements for accessibility users.
                
//                Theme
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.themeColor.nameColor)
                        .padding(4)
                        .foregroundColor(scrum.themeColor.accentColor)
                        .background(scrum.themeColor.mainColor) //to fix
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            // PARTECIPANTI
            Section(header: Text("Partecipanti")) {
                ForEach(scrum.attendees) { partecipante in
                    Label(partecipante.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        // Apri la MODALE
        .toolbar {
            Button("Edit") {
                onShowEditView = true
            }
        }
        .sheet(isPresented: $onShowEditView) { // vuole come parametro "isPresented"
            NavigationStack {
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        // Cancel Button
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                onShowEditView = false
                            }
                        }
                        // Done Button
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                onShowEditView = false
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: DailyScrum.scrumData[0])
        }
    }
}
