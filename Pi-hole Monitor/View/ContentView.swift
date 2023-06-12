//
//  ContentView.swift
//  Pi-hole Monitor
//
//  Created by Dev Doshi on 12.06.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var raspis: [Raspi]
    
    // Adding a raspi
    @State var isAddingRaspi = false
    @State var ipAdress = ""
    @State var apiToken = ""
    
    var body: some View {
        NavigationView {
            List {
                // MARK: Side Bar
                ForEach(raspis) { item in
                    NavigationLink {
                        RaspiDetailView(ip: item.ip, token: item.token)
                    } label: {
                        HStack {
                            Text(item.ip)
                        }
                    }
                }
                .onDelete(perform: deleteRaspis)
            }
            .toolbar {
                //MARK: Add Raspi Button
                ToolbarItem {
                    HStack {
                        Button {
                            isAddingRaspi.toggle()
                        } label: {
                            Label("Add Raspi", systemImage: "plus")
                        }

                    }
                }
            }
            Text("Please select or add a Pi-hole")
        }
        .sheet(isPresented: $isAddingRaspi) {
            //MARK: Add Raspi View
            VStack(alignment: .leading) {
                Text("Adding a Pi-Hole")
                    .padding(.bottom)
                HStack {
                    Text("IP address:")
                    Spacer()
                        .padding(.horizontal)
                    TextField("192.168.0.1", text: $ipAdress)
                }
                .padding(.bottom)
                HStack {
                    Text("Pi-hole API token:")
                    Spacer()
                        .padding(.horizontal)
                    SecureField("", text: $apiToken)
                    
                }
                .padding(.bottom)
                HStack {
                    Spacer()
                    Button {
                        isAddingRaspi.toggle()
                    } label: {
                        Text("Cancel")
                    }

                    Button {
                        if (ipAdress == "") {
                            print("no")
                        } else {
                            isAddingRaspi.toggle()
                            addItem(ip: ipAdress, token: apiToken)
                        }
                    } label: {
                        Text("Confirm")
                    }
                    Spacer()
                }
                .padding(.bottom)
            }
            .frame(width: 400, height: 175)
            .padding()
        }
    }

    private func addItem(ip: String, token: String) {
        withAnimation {
            let newItem = Raspi(ip: ip, token: token)
            modelContext.insert(newItem)
        }
    }

    private func deleteRaspis(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(raspis[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Raspi.self, inMemory: true)
}
