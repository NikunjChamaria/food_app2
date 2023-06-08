import 'package:food_app/models/popular_product_models.dart';

class CartModel {
  int? id;
  String? name;
  int? quantity;
  int? price;
  bool? isExist;
  String? img;
  String? time;
  ProductModel? product;
  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExist,
      this.quantity,
      this.time,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isExist = json['isExist'];
    price = json['price'];
    quantity = json['quantity'];
    img = json['img'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product": this.product!.toJson()
    };
  }
}
