import SwiftUI

struct SpeakerArc: Shape {
    
    let speakerIndex: Int
    let totalSpeaker: Int
    
    
    /// Calcola i GRADI del cerchio per speaker
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeaker)
    }
    
    
    
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
        /// Quando disegni un PATH, avrai bisogno di un angolo per l'inizio e la fine dell'arco.
        /// L'ulteriore grado 1.0 serve per la separazione visiva tra i segmenti dell'arco.
    }
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0) /// la sottrazione a -1.0 è per la separazione visuale tra i segmenti di arco
    }
    
    func path(in rect: CGRect) -> Path {
        
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
