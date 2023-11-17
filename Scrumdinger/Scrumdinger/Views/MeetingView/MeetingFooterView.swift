//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 17/11/23.
//

import SwiftUI

struct MeetingFooterView: View {
    var body: some View {
        HStack {
            Text("Speaker 1 of 3")
            Spacer()
            Button(action: {}) {
                Image(systemName: "forward.fill")
            }
            .accessibilityLabel("Next Speaker")
        }
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView()
            .previewLayout(.sizeThatFits)
    }
}
