import 'individual_bar.dart';

class barData{
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  barData({
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount
});
  List names=[
    "MO",
    "TU",
    "WE",
    "TH",
    "FR",
    "SA",
    "SU"
  ];


  List<individualBar>bardata=[];

  void initializeBardata(index){
    bardata =
    [
      individualBar(x:1, y: monAmount),
      individualBar(x: 2, y: tueAmount),
      individualBar(x: 3, y: wedAmount),
      individualBar(x: 4, y: thuAmount),
      individualBar(x: 5, y: friAmount),
      individualBar(x: 6, y: satAmount),
      individualBar(x: 7, y: sunAmount)

    ];
  }
}