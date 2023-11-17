//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 17/11/23.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void /// allow users to skip to the next speaker.
    
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    /// This property is true if the isCompleted property of each speaker except the final speaker is true.
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy {!$0.isCompleted }
    }
    
    ///  returns information about the active speaker, and pass it to the Text view.
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.scrumData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
