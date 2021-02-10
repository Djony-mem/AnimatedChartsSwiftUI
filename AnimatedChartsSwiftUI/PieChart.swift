//
//  PieChart.swift
//  AnimatedChartsSwiftUI
//
//  Created by Brubrusha on 2/9/21.
//

import SwiftUI

struct PieChart: View {
    @ObservedObject var charDataObj = PieceOfPieContainer()
    @State private var indexOfTappedSlice = -1
    
    var body: some View {
        VStack {
            chartCircleView
                .frame(width: 100, height: 200)
                .onAppear() {
                    self.charDataObj.calcOfPath()
                }
            chartListView
                .padding(8)
                .frame(width: 300, alignment: .trailing)
        }
    }
}

// MARK: - Private Properties
extension PieChart {
    private var chartCircleView: some View {
        ZStack {
            ForEach(0..<charDataObj.chartData.count) { index in
                Circle()
                    .trim(from: index == 0 ? 0.0 : charDataObj.chartData[index - 1].value / 100,
                          to: charDataObj.chartData[index].value/100)
                    .stroke(charDataObj.chartData[index].color, lineWidth: 100)
                    .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                    .animation(.spring())
            }
        }
    }
    
    private var chartListView: some View {
        ForEach(0..<charDataObj.chartData.count) { index in
            HStack {
                Text(String(format: "%.2f", Double(charDataObj.chartData[index].percent)) + "%")
                    .onTapGesture {
                        indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                    }
                    .font(indexOfTappedSlice == index ? .headline: .subheadline)
                RoundedRectangle(cornerRadius: 3)
                    .fill(charDataObj.chartData[index].color)
                    .frame(width: 20, height: 20)

            }
            
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
