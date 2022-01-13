import './cart_item.dart';

class Cart {

  final String id;
  final String time;

  Cart({
    required this.id,
    required this.time,
  });


  Cart.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as String,
      time: json['time']! as String,

  );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'time':time,
    };
  }

}
