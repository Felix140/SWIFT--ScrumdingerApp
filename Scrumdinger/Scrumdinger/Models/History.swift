import Foundation


/// Identifiable: Identifiable è un protocollo integrato in Swift che consente di identificare in modo univoco
/// un'istanza di un tipo di dati. Per conformarsi a questo protocollo, un tipo di dati deve avere una proprietà
/// denominata id che contiene un identificatore univoco.


struct History: Identifiable, Codable {
    
    let id: UUID ///  È un numero intero a 128 bit che viene generato in modo casuale e che è altamente improbabile che venga generato più di una volta.
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
    init(
        id: UUID = UUID(), /// UUID() function generates a new, unique identifier for each History instance.
        date: Date = Date(), /// The DATE() function returns the current date and time.
        attendees: [DailyScrum.Attendee])  {
        
            self.id = id
            self.date = date
            self.attendees = attendees
            
    }
}
