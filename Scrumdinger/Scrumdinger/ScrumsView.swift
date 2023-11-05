//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 04/11/23.
//

import SwiftUI

struct ScrumsView: View { //rappresenta la vista principale dell'applicazione.
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums, id: \.title) { element in
            //Text(row.title)
            CardView(scrum: element)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    
    static var scrumss = DailyScrum.scrumData
    
    static var previews: some View { //restituisce una o più anteprime della VIEW principale
        
        ScrumsView(scrums: scrumss)
    }
}