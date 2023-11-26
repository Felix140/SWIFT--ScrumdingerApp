//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Felix Valdez on 03/11/23.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @Binding var meetScrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer() /// SOURCE OF TRUTH
    @StateObject var speechRecognizer = SpeechRecognizer() /// SOURCE OF TRUTH
    private var player: AVPlayer {AVPlayer.sharedDingPlayer}
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(meetScrum.themeColor.mainColor)
            
            VStack {
                
                /// HEADER
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: meetScrum.themeColor)
                
                /// MEETING TIMER
                MeetingTimerView(speakers: scrumTimer.speakers , theme: meetScrum.themeColor)
                
                
                /// FOOTER
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
            .padding()
        }
        .padding()
        .foregroundColor(meetScrum.themeColor.accentColor)
        .onAppear {  /// LifeCycle Hook
            startSrumm()
        }
        .onDisappear { /// LifeCycle Hook
           endScrumm()
        }
        .navigationBarTitleDisplayMode(.inline) // Imposta la modalità di visualizzazione del titolo della barra di navigazione
    }
    
    
    /// Start LifeCycle
    private func startSrumm() {
        scrumTimer.reset(lengthInMinutes: meetScrum.lengthInMinutes, attendees: meetScrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }

    }
    /// End LifeCycle
    private func endScrumm() {
        scrumTimer.stopScrum()
        
        let newHistory = History(attendees: meetScrum.attendees)
        meetScrum.history.insert(newHistory, at: 0)
    }
}

struct MeetingView_Previews: PreviewProvider {
    
    static var previews: some View {
        MeetingView(meetScrum: .constant(DailyScrum.scrumData[0]))
        // (.constant) crea variabili con un valore costante che non cambia durante il ciclo di vita della vista
    }
}
