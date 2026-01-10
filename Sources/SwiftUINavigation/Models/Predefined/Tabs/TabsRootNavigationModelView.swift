import SwiftUI

public struct TabsRootNavigationModelView<InputNavigationModel: TabsRootNavigationModel>: View {

    @EnvironmentNavigationModel private var navigationModel: InputNavigationModel

    public init() {}
    
    private var activeAccessory: AnyView? {
        let specificAccessory = navigationModel.tabsModels
            .first(where: { $0.id == navigationModel.selectedTabModelID })?
            .accessory
        
        return specificAccessory ?? navigationModel.accessory
    }

    public var body: some View {
        TabView(selection: selection) {
            ForEach(navigationModel.tabsModels, id: \.id) { model in
                Tab(model.title, systemImage: model.systemImage, value: model.id, role: model.role) {
                    model.content
                        .onAppear { handleOnAppear(for: model.id) }
                }
                .badge(model.badge ?? 0)
            }
        }
        .tabViewBottomAccessory(optional: activeAccessory)
    }
    
    // MARK: - Logic
    private func handleOnAppear(for modelID: AnyHashable) {
        if ProcessInfo.processInfo.isMacCatalystApp {
            selection.wrappedValue = modelID
        }
    }

    private var selection: Binding<AnyHashable> {
        Binding(
            get: { navigationModel.selectedTabModelID },
            set: { navigationModel.selectedTabModelID = $0 }
        )
    }
}
