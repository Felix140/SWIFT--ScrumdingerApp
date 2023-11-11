//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 03/11/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.scrumData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums) // the initial view for the app.
        }
    }
}
