import Foundation

/// Un ObservableObject include un publisher objectWillChange che emette quando una
/// delle sue proprietà @Published sta per cambiare. Qualsiasi vista che osserva un'istanza
/// di ScrumStore verrà resa nuovamente quando il valore scrums cambia.

@MainActor /// specifica che le funzioni asincrone intervengono nel main thread
class ScrumStore: ObservableObject { /// ObservableObject: Questo è un protocollo in Swift utilizzato per identificare oggetti che possono essere osservati per cambiamenti.
    
    @Published var scrums: [DailyScrum] = [] /// @Published: Questo è un wrapper di proprietà in Swift utilizzato per contrassegnare una proprietà come osservabile.
    
    private static func fileURL() throws -> URL {
        
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false)
        
        .appendingPathComponent("scrum.data") /// ritorna l'URL del file chiamato "scrum.data"
    }
    
    
    // LOAD data
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileUrl = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data) /// DECODIFICA i dati dentro la costante locale dailyScrum
            return dailyScrums
        }
        let scrumsResult = try await task.value /// assegna il valore asincrono a SCRUMS
        self.scrums = scrumsResult
    }
    
    // SAVE data
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums) /// codifica i dati
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
            _ = try await task.value /// Il carattere di sottolineatura indica che non sei interessato al risultato di task.value
        }
    }
    
    
}
