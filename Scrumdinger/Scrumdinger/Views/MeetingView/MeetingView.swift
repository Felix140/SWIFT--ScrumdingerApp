//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 03/11/23.
//

import SwiftUI

struct MeetingView: View {
    
    @Binding var meetScrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(meetScrum.themeColor.mainColor)
            
            VStack {
                
                /// Header
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: meetScrum.themeColor)
                
                ProgressView(value: 5, total: 15)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Second Elapsed")
                            .font(.caption)
                        Label("300", systemImage: "hourglass.tophalf.fill")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Second Remaining")
                            .font(.caption)
                        Label("600", systemImage: "hourglass.tophalf.fill")
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time remaining")
                .accessibilityValue("10 minutes")
                
                Circle()
                    .strokeBorder(lineWidth: 18)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .foregroundColor(Color.black)
                    }
                    .accessibilityLabel(Text("Next"))
                }
            }
            .padding()
        }
        .padding()
        .foregroundColor(meetScrum.themeColor.accentColor)
        .onAppear {  /// LifeCycle Hook
            scrumTimer.reset(lengthInMinutes: scrumTimer.lengthInMinutes, attendees: meetScrum.attendees)
            scrumTimer.startScrum()
        }
        .onDisappear { /// LifeCycle Hook
            scrumTimer.stopScrum()
        }
        .navigationBarTitleDisplayMode(.inline) // Imposta la modalità di visualizzazione del titolo della barra di navigazione
    }
}

struct MeetingView_Previews: PreviewProvider {
    
    static var previews: some View {
        MeetingView(meetScrum: .constant(DailyScrum.scrumData[0]))
        // (.constant) crea variabili con un valore costante che non cambia durante il ciclo di vita della vista
    }
}