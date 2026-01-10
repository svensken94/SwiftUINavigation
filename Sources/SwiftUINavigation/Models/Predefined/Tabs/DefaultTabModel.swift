import SwiftUI

public struct DefaultTabModel: @MainActor TabModel {
    public let navigationModel: any NavigationModel
    public let id: AnyHashable
    public let title: String
    public let systemImage: String
    public let role: TabRole?
    public let badge: Int?
    public let accessory: AnyView?

    public init<Accessory: View>(
        id: AnyHashable,
        title: String,
        systemImage: String,
        navigationModel: any NavigationModel,
        role: TabRole? = nil,
        badge: Int? = nil,
        @ViewBuilder accessory: () -> Accessory
    ) {
        self.id = id
        self.title = title
        self.systemImage = systemImage
        self.navigationModel = navigationModel
        self.role = role
        self.badge = badge
        
        if Accessory.self == EmptyView.self {
            self.accessory = nil
        } else {
            self.accessory = AnyView(accessory())
        }
    }
    
    public init(
        id: AnyHashable,
        title: String,
        systemImage: String,
        navigationModel: any NavigationModel,
        role: TabRole? = nil,
        badge: Int? = nil,
    ) {
        self.init(id: id, title: title, systemImage: systemImage, navigationModel: navigationModel, role: role, badge: badge, accessory: { EmptyView() })
    }

    public var content: AnyView {
        AnyView(NavigationModelResolvedView(model: navigationModel))
    }
}
