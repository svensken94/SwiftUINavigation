import SwiftUI

public struct DefaultTabModel: TabModel {
    public let id: AnyHashable
    public let title: String
    public let systemImage: String
    public let role: TabRole?
    public let navigationModel: any NavigationModel
    
    public let badge: Int?

    public init(id: AnyHashable, image: String, title: String, navigationModel: any NavigationModel, tabRole: TabRole? = nil, badge: Int? = nil) {
        self.id = id
        self.systemImage = image
        self.title = title
        self.navigationModel = navigationModel
        self.role = tabRole
        self.badge = badge
    }

    public var content: AnyView {
        AnyView(NavigationModelResolvedView(model: navigationModel))
    }
}
