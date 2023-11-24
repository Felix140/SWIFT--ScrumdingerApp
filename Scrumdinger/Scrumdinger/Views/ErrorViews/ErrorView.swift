import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismissAction
    /// Con il property wrapper @Environment puoi leggere un valore che l'ambiente della vista memorizza, come la modalità di presentazione della vista, la fase della scena, la visibilità o lo schema dei colori.
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 20.0) {
                Text("Si è verificato un errore")
                    .font(.title)
                    .foregroundColor(.red)
                
                Text(errorWrapper.error.localizedDescription) /// L'errore fornisce una descrizione della stringa localizzata.
                    .font(.headline)
                
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                
                
                Spacer()
            }
            .padding(20.0)
            .background(.ultraThinMaterial)
            .cornerRadius(16.0)
            .padding(20)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        dismissAction()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(
            error: SampleError.errorRequired,
            guidance: "Hello Error Ignore it")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
