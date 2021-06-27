import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class LineChart extends StatefulWidget {
  @override
  LineChartState createState() => LineChartState();
}

class LineChartState extends State<LineChart> {
  var _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Text(
          'Statistics & Data',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Kumbh Sans',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Hospital Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Kumbh Sans',
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.32,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        StatsGridBox(
                          title: 'Total Appointments :',
                          count: '130',
                        ),
                        StatsGridBox(title: 'No. of Departments:', count: '10'),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        StatsGridBox(title: 'No. of Doctors', count: '18'),
                        StatsGridBox(title: 'No. of Nurses', count: '25'),
                        StatsGridBox(title: 'No. of Users', count: '140'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              height: 200.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Data Analysis',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          fontFamily: 'Kumbh Sans',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        tooltipBehavior: _tooltipBehavior,
                        series: <ChartSeries<_SalesData, String>>[
                          LineSeries<_SalesData, String>(
                              enableTooltip: true,
                              dataSource: data,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) =>
                                  sales.sales,
                              name: 'Sales',
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<_SalesData> data = [
    _SalesData('Jan', 0),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class StatsGridBox extends StatelessWidget {
  final title;
  final count;

  const StatsGridBox({
    Key key,
    @required this.title,
    @required this.count,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
                fontFamily: 'Kumbh Sans',
              ),
            ),
            Text(
              count,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                fontFamily: 'Kumbh Sans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
