import Foundation

// Modello
struct DailyScrum {
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
