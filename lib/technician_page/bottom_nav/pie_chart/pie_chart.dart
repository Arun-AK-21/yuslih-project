import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:fl_chart_app/presentation/widgets/indicator.dart';


class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3/2,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 3/2,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              // Indicator(
              //   color: AppColors.contentColorYellow,
              //   text: 'Second',
              //   isSquare: true,
              // ),
              SizedBox(
                height: 4,
              ),
              // Indicator(
              //   color: AppColors.contentColorPurple,
              //   text: 'Third',
              //   isSquare: true,
              // ),
              SizedBox(
                height: 4,
              ),
              // Indicator(
              //   color: AppColors.contentColorGreen,
              //   text: 'Fourth',
              //   isSquare: true,
              // ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = 15.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xff6665dd),
            showTitle: false,
            value: 40,

            radius: radius,

          );
        case 1:
          return PieChartSectionData(
            color:Color(0xff34D196),

            value: 30,
            showTitle: false,

            radius: radius,

          );
        case 2:
          return

            PieChartSectionData(
            color:Color(0xffFF715B),
            value: 30,
            showTitle: false,


            radius: radius,

          );

        default:
          throw Error();
      }
    });
  }
}
