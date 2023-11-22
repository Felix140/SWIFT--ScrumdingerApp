import SwiftUI

struct DetailEditView: View {

    @Binding var scrum: DailyScrum // scrum è ora un parametro di inizializzazione (no PRIVATE)
    @State private var newAttendeeName = "" // holds the attendee name that the user enters
    
    var body: some View {
        Form {
            
            // Sezione INFO
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title) // the $ syntax create a binding to scrum.title
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ThemePicker(selection: $scrum.themeColor)
            }
            
            // Sezione PARTECIPANTI
            Section(header: Text("Partecipanti")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices) //remove attendees from the scrum data.
                }
                
                HStack {
                    TextField("Nuovo partecipante", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.scrumData[0]))
    }
}
