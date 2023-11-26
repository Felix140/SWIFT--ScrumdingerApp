import SwiftUI

struct MeetingTimerView: View {
    
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24) /// Stroke
                .overlay {
                    VStack {
                        Text(currentSpeaker)
                            .font(.title)
                        Text("is Speaking")
                    }
                    .accessibilityElement(children: .combine)
                    .foregroundColor(theme.accentColor)
                }
                .overlay {
                    
                    ForEach(speakers) { elem in
                        if elem.isCompleted, let index = speakers.firstIndex(where: { $0.id == elem.id }) {
                            SpeakerArc(speakerIndex: index, totalSpeaker: speakers.count)
                                .rotation(Angle(degrees: -90))
                                .stroke(theme.mainColor, lineWidth: 12)
                        }
                    }
                    
                }
                .padding(.horizontal)
          
        }
    }
}


struct MeetingTimerView_Previews: PreviewProvider {
    
    static var speakers: [ScrumTimer.Speaker] {
        [
            ScrumTimer.Speaker(name: "Bill", isCompleted: true),
            ScrumTimer.Speaker(name: "Cathy", isCompleted: false),
        ]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: .yellow)
    }
}
