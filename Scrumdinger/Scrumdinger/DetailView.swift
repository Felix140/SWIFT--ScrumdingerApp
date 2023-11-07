//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 07/11/23.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    var body: some View {
       Text("Page")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: DailyScrum.scrumData[0])
        }
    }
}
