import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum // sono @State tutte le variabili MUTABILI (observed)
    @State private var newAttendeeName = "" // holds the attendee name that the user enters
    
    var body: some View {
        Form {
            
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title) // the $ syntax create a binding to scrum.title
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
            
            Section(header: Text("Partecipanti")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices) //remove attendees from the scrum data.
                }
                
                HStack {
                    TextField("Nuovo partecipante", text: $newAttendeeName)
                    Button(action: {}) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
