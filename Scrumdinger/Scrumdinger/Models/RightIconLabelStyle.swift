import SwiftUI

// Stile per le icone di SX
struct RightIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

// ?
extension LabelStyle where Self == RightIconLabelStyle{
    static var rightIcon: Self { Self() }
}
