//
//  DashboardHeader.swift
//  InventoryManager
//
//  Created by Ryan Mackin on 1/4/21.
//

import SwiftUI

struct DashboardHeader: View {
    
    @Binding var searchText: String
    
    @State private var showingSettingsView = false
    
    var body: some View {
        VStack {
            HStack {
                Text("CA Inventory Manager")
                    .font(.headline)
                    .foregroundColor(Color.primaryText)
                
                Spacer()
                
                Button(action: {
                    self.showingSettingsView.toggle()
                }) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 18)
                        .foregroundColor(Color.primaryText)
                }
                .fullScreenCover(isPresented: $showingSettingsView) {
                    SettingsView()
                }
                .onReceive(NotificationCenter.default.publisher(for: .closeSettingsView)) { _ in
                    self.showingSettingsView = false
                }
            }
            .padding(.bottom, 8)
            
            SearchBar(text: $searchText)
        }
    }
}

struct DashboardHeader_Previews: PreviewProvider {
    static var previews: some View {
        DashboardHeader(searchText: .constant(""))
    }
}
