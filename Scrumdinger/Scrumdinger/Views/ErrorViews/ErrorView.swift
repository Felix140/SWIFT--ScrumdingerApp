import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        
        VStack {
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
        .padding(20)
        .background(.ultraThinMaterial)
        .cornerRadius(16.0)
        .padding(20)
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
