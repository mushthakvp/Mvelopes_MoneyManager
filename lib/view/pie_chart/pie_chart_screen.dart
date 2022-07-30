import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../utilities/color/colors.dart';
import '../../viewmodel/add_edit/hive_impl.dart';
import '../../viewmodel/pie_chart/pie_chart_pov.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Chartdata> chartData = context.read<PieChartPov>().listOfData(context.read<HiveImpl>().recentList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Statistics'),
        centerTitle: true,
        backgroundColor: indigColor,
        actions: [
          IconButton(
              onPressed: () {
                //   _pickDate(context);
              },
              icon: const Icon(Icons.sort)),
          //
        ],
      ),
      body: SafeArea(
        child: chartData.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/image/noChart.svg',
                      height: 160,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'No Transaction Data',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: pinkColor,
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  )
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                child: SfCircularChart(tooltipBehavior: context.read<PieChartPov>().tooltipBehavior, legend: Legend(iconHeight: 20, padding: 10, isVisible: true, overflowMode: LegendItemOverflowMode.wrap), series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<Chartdata, String>(
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        labelIntersectAction: LabelIntersectAction.shift,
                      ),
                      dataSource: chartData,
                      xValueMapper: (Chartdata data, _) => data.categories,
                      yValueMapper: (Chartdata data, _) => data.amount,
                      explode: true,
                      explodeIndex: 1),
                ]),
              ),
      ),
    );
  }

  // _pickDate(context) async {
  //   final selected = await showMonthYearPicker(
  //     context: context,
  //     initialDate: selectedmonth,
  //     firstDate: DateTime(2021),
  //     lastDate: DateTime(2030),
  //   );
  //   setState(() {
  //     selectedmonth = selected!;
  //   });

  //   //getdata(selectedmonth);
  // }
}

// ignore: constant_identifier_names
enum Menu { All, Today, Yesterday, Monthly }
