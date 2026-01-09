import SwiftUI

@MainActor
public protocol TabModel {
    var id: AnyHashable { get }
    var navigationModel: any NavigationModel { get }
    var title: String { get }
    var systemImage: String { get }
    var role: TabRole? { get }
    var badge: Int? { get }
    
    var content: AnyView { get }
}
