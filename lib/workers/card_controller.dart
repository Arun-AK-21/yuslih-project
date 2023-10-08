import 'package:get/get.dart';

import 'card_add.dart';

class CardController extends GetxController{
  Rx<List<addToCard1>> cardFav=  Rx<List<addToCard1>>([]);
  late addToCard1 addCard;
  var itemCount =0.obs;


  addCard1(String name, String cateogry, String price){
    addCard = addToCard1(name: name, Category: cateogry, price: price);
    cardFav.value.add(addCard);
    itemCount.value=cardFav.value.length;
  }
  removeCard(int index){
    cardFav.value.removeAt(index);
    itemCount.value=cardFav.value.length;
  }

}