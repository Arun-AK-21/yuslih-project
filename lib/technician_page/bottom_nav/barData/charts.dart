// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// import 'package:fl_chart_app/util/extensions/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarChart1 extends StatelessWidget {
  const BarChart1();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: BarChart(
        BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups,
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 9,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    final style =GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 6.32,
      color: Color(0xff414D55)
    );
    // TextStyle(
    //   color: Colors.red,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 14,
    // );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'MO';
        break;
      case 1:
        text = 'TU';
        break;
      case 2:
        text = 'WE';
        break;
      case 3:
        text = 'TH';
        break;
      case 4:
        text = 'FR';
        break;
      case 5:
        text = 'SA';
        break;
      case 6:
        text = 'SU';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 20,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  // LinearGradient get _barsGradient => LinearGradient(
  //       colors: [
  //         Colors()
  //         Colors.green,
  //       ],
  //       begin: Alignment.bottomCenter,
  //       end: Alignment.topCenter,
  //     );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          color: Color(0xff0496FF),
          toY: 12,
          // gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [2],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          color: Color(0xff0496FF),
          toY: 18,
            backDrawRodData:BackgroundBarChartRodData(
              show: true,
              color: Color(0xffE4EAF0),
              toY: 20
            )
          // gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [1],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          color: Color(0xff0496FF),
          toY: 25,
          // gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [1],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          color: Color(0xff0496FF),
          toY: 18,
          // gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [1],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          toY: 0,
          color: Color(0xff0496FF),
          // gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [1],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          toY: 15,

          color: Color(0xff0496FF),


          // gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [1],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          toY: 10,
          color: Color(0xff0496FF),
          // gradient: _barsGradient,
        )
      ],
      showingTooltipIndicators: [1],
    ),
  ];
}

