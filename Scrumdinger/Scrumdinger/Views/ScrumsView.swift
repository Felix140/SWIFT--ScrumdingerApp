import SwiftUI

struct ScrumsView: View { //rappresenta la vista principale dell'applicazione.
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase /// SwiftUI indica lo stato operativo corrente delle istanze Scene della tua app con un valore scenePhase Environment
    @State var isPresentingNewScrumView: Bool = false
    let saveAction: ()->Void
    
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
                NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, addScrum: $scrums)
            }
        }
        .onChange(of: scenePhase) { value in
            if value == .inactive {
                saveAction()
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    
    static var scrumss = DailyScrum.scrumData
    
    static var previews: some View { //restituisce una o più anteprime della VIEW principale
        
        ScrumsView(scrums: .constant(scrumss), saveAction: {})
        // (.constant) crea variabili con un valore costante che non cambia durante il ciclo di vita della vista
    }
}
