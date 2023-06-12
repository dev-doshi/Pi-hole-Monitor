//
//  DashBoardCardView.swift
//  Pi-hole Monitor
//
//  Created by Dev Doshi on 14.06.23.
//

import SwiftUI

struct DashBoardCardView: View {
    
    var title: String
    var titleNumber: String
    var secondTitle: String
    var secondTitleNumber: String
    
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
                .brightness(0.3)
                .opacity(0.5)
            VStack {
                Text(title)
                Text(titleNumber)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
                Divider()
                HStack {
                    Text(secondTitleNumber)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text(secondTitle)
                }
            }
        }
    }
}

#Preview {
    DashBoardCardView(title: "Queries Today", titleNumber: "1298", secondTitle: "Queries All Types", secondTitleNumber: "1298", color: .blue)
}
