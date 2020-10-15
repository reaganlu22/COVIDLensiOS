//
//  TabContainterView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/9/20.
//

import SwiftUI

@available(iOS 14.0, *)
struct TabContainterView: View {
    @StateObject private var tabContainerViewModel = TabContainterViewModel()
    
    var body: some View {
        TabView(selection: $tabContainerViewModel.selectedTab){
            
            ForEach(tabContainerViewModel.tabItemViewModels, id: \.self) { viewModel in
                tabView(for: viewModel.type)
                    .tabItem {
                        Image(systemName: viewModel.imageName)
                        Text(viewModel.title)
                    }
                    .tag(viewModel.type)
            }
        }.accentColor(Color(red: 0/255, green: 193/255, blue: 203/255))
    }
    
    @ViewBuilder
    func tabView(for TabItemType: TabItemViewModel.TabItemType) -> some View {
        switch TabItemType {
        case .home:
            HomeView()
        case .map:
            MapView()
        case .resources:
            ResourcesView()
        case .selfreport:
            SelfReportView()
        case .settings:
            SettingsView()
        }
    }
}

final class TabContainterViewModel: ObservableObject {
    @Published var selectedTab: TabItemViewModel.TabItemType = .home
    
    let tabItemViewModels = [
        TabItemViewModel(imageName: "house.fill", title: "Home", type: .home),
        .init(imageName: "map.fill", title: "Map", type: .map),
        .init(imageName: "info.circle.fill", title: "Resources", type: .resources),
        .init(imageName: "pencil.circle.fill", title: "Self-Report", type: .selfreport),
        .init(imageName: "gearshape.fill", title: "Settings", type: .settings)
    ]
}

struct TabItemViewModel: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType {
        case home
        case map
        case resources
        case selfreport
        case settings
    }
}
