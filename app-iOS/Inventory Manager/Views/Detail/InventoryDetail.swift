//
//  InventoryDetail.swift
//  InventoryManager
//
//  Created by Ryan Mackin on 12/31/20.
//

import SwiftUI

struct InventoryDetail: View {
    
    var inventory: Inventory
    
    var body: some View {
        VStack {
            // Employee details
            VStack(alignment: .leading) {
                Text("Employee")
                    .font(.title3)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.primaryBackground),
                        alignment: .bottom
                    )
                InventoryDetailEntry(header: "Name", text: inventory.holder.name)
                InventoryDetailEntry(header: "Email", text: inventory.holder.email)
                InventoryDetailEntry(header: "Phone", text: inventory.holder.phone)
            }
            .padding(.bottom, 10)
            
            // Device details
            VStack(alignment: .leading) {
                Text("Device")
                    .font(.title3)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.primaryBackground),
                        alignment: .bottom
                    )

                InventoryDetailEntry(header: "Model Name", text: inventory.device.modelName)
                InventoryDetailEntry(header: "Model Identifier", text: inventory.device.modelIdentifier)
                InventoryDetailEntry(header: "Model Number", text: inventory.device.modelNumber)
                InventoryDetailEntry(header: "Serial Number", text: inventory.device.serialNumber)
                InventoryDetailEntry(header: "Hardware UUID", text: inventory.device.hardwareUUID)
            }
            .padding(.bottom, 10)

            // Location details
            VStack(alignment: .leading) {
                Text("Location")
                    .font(.title3)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.primaryBackground),
                        alignment: .bottom
                    )

                InventoryDetailEntry(header: "Address", text: inventory.locations[0].address)
                InventoryDetailEntry(header: "Timestamp", text: inventory.locations[0].timestamp)
                InventoryDetailEntry(header: "Status", text: inventory.locations[0].status)
            }
        }
        .foregroundColor(Color.primaryText)
    }
}

private struct InventoryDetailEntry: View {
    
    @State var header: String
    @State var text: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(header).fontWeight(.semibold)
            Spacer()
            Text(text)
        }
        .fixedSize(horizontal: false, vertical: true)
        .foregroundColor(Color.primaryText)
    }
}

struct InventoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        InventoryDetail(inventory: INVENTORY)
    }
}
