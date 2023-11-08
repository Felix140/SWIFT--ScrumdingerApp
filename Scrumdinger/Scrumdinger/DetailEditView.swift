import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum // sono @State tutte le variabili MUTABILI (observed)
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title) // the $ syntax create a binding to scrum.title
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble) {
                        Text("Length")
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
