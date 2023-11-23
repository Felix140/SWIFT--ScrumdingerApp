import Foundation

/// Un ObservableObject include un publisher objectWillChange che emette quando una
/// delle sue proprietà @Published sta per cambiare. Qualsiasi vista che osserva un'istanza
/// di ScrumStore verrà resa nuovamente quando il valore scrums cambia.

class ScrumStore: ObservableObject { /// ObservableObject: Questo è un protocollo in Swift utilizzato per identificare oggetti che possono essere osservati per cambiamenti.
    
    @Published var scrums: [DailyScrum] = [] /// @Published: Questo è un wrapper di proprietà in Swift utilizzato per contrassegnare una proprietà come osservabile.
    
    private static func fileURL() -> URL {
        
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false)
        
        .appendingPathComponent("scrum.data") /// ritorna l'URL del file chiamato "scrum.data"
    }
}
