import SwiftUI

@MainActor
public protocol TabModel: Identifiable {
    var id: AnyHashable { get }
    var title: String { get }
    var systemImage: String { get }
    var navigationModel: any NavigationModel { get }
    var role: TabRole? { get }
    var badge: Int? { get }
    
    var content: AnyView { get }
    
    var accessory: AnyView? { get }
}

public extension TabModel {
    var role: TabRole? { nil }
    var badge: Int? { nil }
    var accessory: AnyView? { nil }
}
