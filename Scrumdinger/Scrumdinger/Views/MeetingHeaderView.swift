//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 17/11/23.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int = 10
    let secondsRemaining: Int = 10
    
    //Totale dei secondi
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    //Valore della progress bar
    private var progressBar: Double {
        if totalSeconds > 0 {
            return Double(secondsElapsed) / Double(totalSeconds)
        } else {
            return 1
        }
    }
    
    //Minuti rimanenti
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progressBar)
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")

    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView()
            .previewLayout(.sizeThatFits)  // dimensiona la View dal contenuto
    }
}
