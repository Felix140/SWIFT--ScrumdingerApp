//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 03/11/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore() /// Il property wrapper @StateObject crea una singola istanza di un oggetto osservabile per ogni istanza della struttura che lo dichiara.
    // @State private var scrums = DailyScrum.scrumData
    @State private var errorWrapper: ErrorWrapper? /// Il valore predefinito di un optional è NIL
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) { /// the initial view for the app.
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        // fatalError(error.localizedDescription)
                        errorWrapper = ErrorWrapper(error: error, guidance: "Riprova più tardi")
                    }
                }
            }
            .task { ///  caricherai i dati scrum dell'utente quando la vista root dell'app apparirà sullo schermo
                
                ///Caricare lo scrum salvato o interrompere l'esecuzione se load() genera un errore.
                do {
                    try await store.load()
                } catch {
                    // fatalError(error.localizedDescription)
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger caricherà i dati")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.scrumData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
