// import 'dart:convert';

import 'package:get/get.dart';

// import 'FigmaApi.dart';
import 'card_add.dart';
import 'package:http/http.dart' as http;

import 'painterApi.dart';

class PainterController extends GetxController{
   RxList name = [1,2,3,4,5,6,7].obs;
  // RxList<PainterApi> paint=RxList<PainterApi>();
  RxList tempName=[].obs;
  // var data=Get.arguments;
  // Rx<List<addToCard1>> cardFav=  Rx<List<addToCard1>>([]);
  // late addToCard1 addCard;
  // var itemCount =0.obs;

  addToFavorite(String value){
    tempName.add(value);
  }
  removeFromFavorite(String value){
    tempName.remove(value);
  }

  // addToCard(String value){
  //   cardFav.add(data);
  // }

  // addCard1(String name, String cateogry, String price){
  //   addCard = addToCard1(name: name, Category: cateogry, price: price);
  //   cardFav.value.add(addCard);
  //   itemCount.value=cardFav.value.length;
  // }
  // removeCard(int index){
  //   cardFav.value.removeAt(index);
  //   itemCount.value=cardFav.value.length;
  // }

  // Future<FigmaApi>getRecords() async {
  //   var response=await http.get(Uri.parse("https://api.jsonbin.io/v3/b/651e63dc12a5d376598775ab"));
  //   if(response.statusCode==200){
  //     var jsondata=jsonDecode(response.body.toString());
  //     var data=FigmaApi.fromJson(jsondata);
  //     // var list=data;
  //     return data;
  //   }else{
  //     throw Exception("failed to load list");
  //   }
  // }

}

