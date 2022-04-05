/*import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';

class MoodTrackerScreen2 extends StatefulWidget {
  const MoodTrackerScreen2({Key? key}) : super(key: key);

  @override
  _MoodTrackerScreen2State createState() => _MoodTrackerScreen2State();
}

class _MoodTrackerScreen2State extends State<MoodTrackerScreen2> {

  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
            body: Column(
              children: [
                const Padding(padding: EdgeInsets.all(8)),
                const Text(
                  "Mood History",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(61, 90, 128, 100),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: const Icon(Icons.arrow_circle_left),
                    onPressed: (){

                    },),
                    Text(DateTime.now().month.toString()),
                  ],
                ),
                Expanded(
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Yearly sales analysis'),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      LineSeries<SalesData, double>(
                          name: 'Sales',
                          dataSource: _chartData,
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          enableTooltip: true)
                    ],
                    primaryXAxis: NumericAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                    ),
                    primaryYAxis: NumericAxis(
                        labelFormat: '{value}M',
                        numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
                  ),
                ),
              ],
            )));
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30)
    ];
    return chartData;
  }

  // List<Color> gradientColors = [
  //   const Color(0xff8e7ebe),
  //   const Color(0xffbd9fbe),
  // ];
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //    // backgroundColor: Colors.deepPurple,
  //     body: Center(
  //       child: SizedBox(
  //         width: 400,
  //         height: 400,
  //         child: LineChart(
  //           LineChartData(
  //             // borderData: FlBorderData(
  //             //   show: true,
  //             //   border: Border.all(color: Colors.deepOrange, width: 2)
  //             // ),
  //             gridData: FlGridData(
  //               show: true,
  //               getDrawingHorizontalLine: (value){
  //                 return FlLine(
  //                   color: Colors.black,
  //                   strokeWidth: 1,
  //                 );
  //               },
  //               drawVerticalLine: true,
  //               getDrawingVerticalLine: (value){
  //                 return FlLine(
  //                   color: Colors.black,
  //                   strokeWidth: 1,
  //                 );
  //               },
  //             ),
  //             maxX: 7,
  //             maxY: 7,
  //             minY: 0,
  //             minX: 0,
  //             lineBarsData : [
  //               LineChartBarData(
  //                 spots: [
  //                   const FlSpot(0, 0),
  //                   const FlSpot(5, 5),
  //                   const FlSpot(4, 6),
  //                   const FlSpot(3, 4),
  //                 ],
  //                 isCurved: true,
  //                // color: [Colors.blueGrey, Colors.deepOrange, Colors.deepPurpleAccent],
  //                 barWidth: 5,
  //                 // belowBarData: BarAreaData(
  //                 //   show: true,
  //                 //   color: Colors.blueGrey
  //                 //   //color: gradientColors.map((e) => e.withOpacity(0.3)).toList()),
  //                 // ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
*/