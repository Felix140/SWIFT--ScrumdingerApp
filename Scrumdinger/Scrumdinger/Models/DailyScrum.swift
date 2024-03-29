import Foundation

// Modello
struct DailyScrum: Identifiable, Codable {
    let id: UUID // serve a identificare il singolo DailyScrum al momento del ciclo List in CardView
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var themeColor: Theme
    var history: [History] = []
    
//    aggiungo un INITIALAZER
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, themeColor: Theme) {
        self.id = id // assegnare a "= UUID()"
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.themeColor = themeColor
    }
}



extension DailyScrum {
    
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    /// Modello Scrum VUOTO da aggiungere
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, themeColor: .sky)
    }
    
}



extension DailyScrum {
    
    static var scrumData: [DailyScrum] = [
        
    DailyScrum(
        title: "iOS Developer",
        attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
        lengthInMinutes: 10,
        themeColor: .yellow ),
    
    DailyScrum(title: "App Developer",
               attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
               lengthInMinutes: 5,
               themeColor: .orange ),

    DailyScrum(title: "Web Developer",
               attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
               lengthInMinutes: 5,
               themeColor: .poppy ),
    
    DailyScrum(title: "UX/UI Design",
               attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
               lengthInMinutes: 5,
               themeColor: .magenta ),
    
    DailyScrum(title: "Data Scientist",
               attendees: ["Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
               lengthInMinutes: 5,
               themeColor: .seafoam ),
    
    DailyScrum(title: "Data Analyst",
               attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
               lengthInMinutes: 5,
               themeColor: .bubbleGum ),
    
    DailyScrum(title: "AI Engineer",
               attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
               lengthInMinutes: 5,
               themeColor: .sky )
    
    
    ]
}
