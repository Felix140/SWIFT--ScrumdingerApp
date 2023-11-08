import Foundation

// Modello
struct DailyScrum: Identifiable {
    let id: UUID // serve a identificare il singolo DailyScrum al momento del ciclo List in CardView
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var themeColor: Theme
    
//    aggiungo un INITIALAZER
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, themeColor: Theme) {
        self.id = id // assegnare a "= UUID()"
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.themeColor = themeColor
    }
}

extension DailyScrum {
    
    struct Attendees: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID, name: String) {
            self.id = id
            self.name = name
        }
    }
    
}



extension DailyScrum {
    
    static var scrumData: [DailyScrum] = [
        
    DailyScrum(
        title: "Programming",
        attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
        lengthInMinutes: 10,
        themeColor: .yellow ),
    
    DailyScrum(title: "App Dev",
               attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
               lengthInMinutes: 5,
               themeColor: .orange ),

    DailyScrum(title: "Web Dev",
               attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
               lengthInMinutes: 5,
               themeColor: .poppy )
    
    ]
}
