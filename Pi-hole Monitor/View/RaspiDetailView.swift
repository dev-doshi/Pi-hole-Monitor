//
//  RaspiDetailView.swift
//  Pi-hole Monitor
//
//  Created by Dev Doshi on 13.06.23.
//

import SwiftUI

struct RaspiDetailView: View {
    
    var ip:String
    var token:String
    
    var body: some View {
        DashBoardView(ip: ip, token: token)
    }
}

#Preview {
    RaspiDetailView(ip: "192.168.178.54", token: "c696d2c9fe152515b4e894756c425a6fb1d1dca3d41e52278a139820040dda6c")
}
