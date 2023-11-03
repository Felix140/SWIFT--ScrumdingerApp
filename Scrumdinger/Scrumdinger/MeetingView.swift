//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 03/11/23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        ProgressView(value: 10, total: 15)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
