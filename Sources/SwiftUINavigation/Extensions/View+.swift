import SwiftUI

extension View {
    @ViewBuilder
    func tabViewBottomAccessory(optional content: AnyView?) -> some View {
        if let content {
            self.tabViewBottomAccessory {
                content
            }
        } else {
            self
        }
    }
}
