import SwiftUI

struct ProgressBarStyle: ProgressViewStyle {
    var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            
            if #available(iOS 15.0, *) { // #available verifica disponibilità di funzionalià o versioni
                ProgressView (configuration) // esegui solo se iOS 15.0 è disponibile
                    .tint(theme.mainColor)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            } else {
                ProgressView (configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            }
        }
    }
}


struct ProgressBarStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ProgressBarStyle(theme: .bubbleGum))
            .previewLayout(.sizeThatFits)
    }
}
