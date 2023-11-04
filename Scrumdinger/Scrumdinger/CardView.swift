//
//  CardView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 03/11/23.
//

import SwiftUI

struct CardView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.title)
                .accessibilityAddTraits(.isHeader) // tag info
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.rightIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.themeColor.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var scrumm = DailyScrum.scrumData[1]
    
    static var previews: some View {
        CardView(scrum: scrumm)
            .background(.yellow)
            .previewLayout(.fixed(width: 400, height: 60)) // layout PREVIEW
    }
    
}
