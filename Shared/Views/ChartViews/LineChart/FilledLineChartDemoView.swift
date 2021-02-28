//
//  FilledLineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 26/01/2021.
//

import SwiftUI
import SwiftUICharts

struct FilledLineChartDemoView: View {

    let data : LineChartData = weekOfData()

    var body: some View {
        VStack {
                        
            FilledLineChart(chartData: data)
                .touchOverlay(chartData: data, unit: .suffix(of: "Steps"))
                .pointMarkers(chartData: data)
                .averageLine(chartData: data,
                             strokeStyle: StrokeStyle(lineWidth: 3,dash: [5,10]))
                .yAxisPOI(chartData: data,
                          markerName: "50",
                          markerValue: 50,
                          lineColour: Color(red: 0.25, green: 0.25, blue: 1.0),
                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .xAxisGrid(chartData: data)
                .yAxisGrid(chartData: data)
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data)
                .infoBox(chartData: data)
                .headerBox(chartData: data)
                .legends(chartData: data)
                .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 450, maxHeight: 600, alignment: .center)
                .padding(.all, 24)
                .background(
                    ZStack {
                        DemoContainer()
                    }
                )
                .padding(.horizontal)
        }
        .navigationTitle("Week of Data")
    }
}

struct FilledLineChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FilledLineChartDemoView()
    }
}

extension FilledLineChartDemoView {
    
    static func weekOfData() -> LineChartData {
        
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 20,  xAxisLabel: "M", pointLabel: "Monday"),
            LineChartDataPoint(value: 90,  xAxisLabel: "T", pointLabel: "Tuesday"),
            LineChartDataPoint(value: 100, xAxisLabel: "W", pointLabel: "Wednesday"),
            LineChartDataPoint(value: 75,  xAxisLabel: "T", pointLabel: "Thursday"),
            LineChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"),
            LineChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday"),
            LineChartDataPoint(value: 90,  xAxisLabel: "S", pointLabel: "Sunday")
        ],
        legendTitle: "Test One",
        pointStyle: PointStyle(),
        style: LineStyle(colour: Color.red))
        
        let metadata = ChartMetadata(title: "Some Data", subtitle: "A Week")
        let labels = ["Monday", "Thursday", "Sunday"]
        
        return LineChartData(dataSets: data,
                             metadata: metadata,
                             xAxisLabels: labels,
                             chartStyle: LineChartStyle(infoBoxPlacement: .header,
                                                        markerType: .full(attachment: .point),
                                                        baseline: .minimumValue))
    }
}

/*
 , dot: .style(DotStyle())
 */
