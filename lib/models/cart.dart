import 'package:flutter/foundation.dart';
import 'drawing.dart';

class Cart extends ChangeNotifier {
  // list of drawings
  List<Drawing> drawingShop = [
    Drawing(
      name: "Desert Man", 
      price: "230", 
      imagePath: 'lib/images/drawing1.jpeg', 
      description: "A man in a desert"
      ),

      Drawing(
        name: "Hermione Granger", 
        price: "180", 
        imagePath: 'lib/images/drawing2.jpeg', 
        description: "Hermione Granger character from Harry Potter"
      ),

      Drawing(
        name: "Gladiator", 
        price: "200", 
        imagePath: 'lib/images/drawing3.jpeg', 
        description: "A gladiator from Ancient Rome"
      ),

      Drawing(
        name: "O Pombo", 
        price: "150", 
        imagePath: 'lib/images/drawing4.jpeg', 
        description: "Soccer player Richarlison from Brazil"
      ),

      Drawing(
        name: "Tupac", 
        price: "150", 
        imagePath: 'lib/images/drawing5.jpeg', 
        description: "Tupac, from other man"
      ),
  ];

  // list of items in user cart
  List<Drawing> userCart = [];

  // get list of drawings for sale
  List<Drawing> getDrawingList() {
    return drawingShop;
  }

  // get cart
  List<Drawing> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Drawing drawing) {
    userCart.add(drawing);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Drawing drawing) {
    userCart.remove(drawing);
    notifyListeners();
  }
}