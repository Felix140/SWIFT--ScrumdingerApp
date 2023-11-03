import Foundation

// Modello
struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var themeColor: Theme
}

extension DailyScrum {
    
    static let scrumData: [DailyScrum] = [
        
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
