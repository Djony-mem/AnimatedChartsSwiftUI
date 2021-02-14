//
//  ChartDataContainer.swift
//  AnimatedChartsSwiftUI
//
//  Created by Brubrusha on 2/9/21.
//

import SwiftUI

class PieceOfPieContainer: ObservableObject {
    @Published var chartData = [
        PieceOfPie(color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), percent: 8, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), percent: 15, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), percent: 32, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), percent: 45, value: 0)
    ]
    
    func calcOfPath() {
        var value: CGFloat = 0
        
        for index in 0..<chartData.count {
            value += chartData[index].percent
            chartData[index].value = value
        }
    }
}









