import 'package:get/get.dart';

class CarpenterController extends GetxController{
// RxList<Record>? carp=RxList<Record>();
RxList num = [1,2,3,4,5,6,7].obs;
RxList tempCarp = [].obs;

addToFavorites(String value){
  tempCarp.add(value);
}
removeFromFavorites(String value){
  tempCarp.remove(value);
}
}