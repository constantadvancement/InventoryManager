//
//  InventoryDetail.swift
//  InventoryManager
//
//  Created by Ryan Mackin on 12/14/20.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    @State private var showingAlert = false
    
    var inventory: Inventory
    
    var body: some View {
        ZStack {
            DeleteAlert(isShowing: $showingAlert, inventory: inventory)
                .zIndex(1)
            
            VStack(spacing: 0) {
                // Header
                DetailHeader(inventory: inventory)
                    .padding()
                    .applyHorizontalBorder(color: Color.tertiaryBackground, alignment: .bottom)
                
                // Body
                MapView(coordinate: inventory.locations[0].coordinate)
                    .overlay(
                        Text("Last reported location")
                            .padding(10)
                            .font(.subheadline)
                            .foregroundColor(Color.secondaryText),
                        alignment: .topLeading
                    )
                    .applyHorizontalBorder(color: Color.tertiaryBackground, alignment: .bottom)

                ScrollView {
                    InventoryDetail(inventory: inventory).padding()

                    DeleteButton(showingAlert: $showingAlert).padding()
                }
                .background(Color.secondaryBackground.ignoresSafeArea())
            }
            .disabled(self.showingAlert ? true : false)
            .opacity(self.showingAlert ? 0.2 : 1.0)
            .background(Color.primaryBackground.ignoresSafeArea())
        }
        
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(inventory: INVENTORY)
    }
}
