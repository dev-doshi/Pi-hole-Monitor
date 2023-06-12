//
//  DashBoardView.swift
//  Pi-hole Monitor
//
//  Created by Dev Doshi on 17.06.23.
//

import SwiftUI

struct DashBoardView: View {
    var ip:String
    var token:String
    
    var service = DataService()
    
    @State var summary = Summary()
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    DashBoardCardView(title: "Queries Today", titleNumber: summary.dnsQueriesToday, secondTitle: "Queries All Types", secondTitleNumber: summary.dnsQueriesAllTypes, color: .blue)
                    DashBoardCardView(title: "Queries Blocked Today", titleNumber: summary.adsBlockedToday, secondTitle: "Unique Domains", secondTitleNumber: summary.adsBlockedToday, color: .red)
                    DashBoardCardView(title: "Clients Seen", titleNumber: summary.clientsEverSeen, secondTitle: "Unique Clients", secondTitleNumber: summary.uniqueClients, color: .yellow)
                    DashBoardCardView(title: "Domains blocked", titleNumber: summary.domainsBeingBlocked, secondTitle: "Queries Cached", secondTitleNumber: summary.queriesCached, color: .green)
                    
                }
                // Update at start and every second after that
                .onAppear(perform: {
                    getSummary()
                    _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
                        getSummary()
                    }
                })
                .frame(height: 125)
                
            }
        }
        .padding()
        .navigationTitle("\(ip)")
        .toolbar {
            //MARK: Status Bar
            
            switch (summary.status) {
            case "enabled":
                Text("Enabled")
                Button {
                    setStatus("disable")
                } label: {
                    Image(systemName: "power")
                        .foregroundStyle(.green)
                }
            case "disabled":
                Text("Disabled")
                Button {
                    setStatus("enable")
                } label: {
                    Image(systemName: "power")
                        .foregroundStyle(.red)
                }
            default:
                Text("Not responding")
                Button {
                    setStatus("enable")
                } label: {
                    Image(systemName: "power")
                        .foregroundStyle(.red)
                }
            }
            Spacer()
            Button {
                getSummary()
            } label: {
                Image(systemName: "arrow.circlepath")
            }
        }
    }
    private func setStatus(_ mode: String) {
        service.setStatus(apiURL:"http://\(ip)/admin/api.php?\(mode)&auth=\(token)")
    }
    private func getSummary() {
        service.getSummary(apiURL: "http://\(ip)/admin/api.php?summary&auth=\(token)") { result, error in
            if let status = result {
                // Handle the `status` data
                self.summary = status
            } else if let error = error {
                // Handle the error
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    DashBoardView(ip: "192.168.178.54", token: "c696d2c9fe152515b4e894756c425a6fb1d1dca3d41e52278a139820040dda6c")
}
