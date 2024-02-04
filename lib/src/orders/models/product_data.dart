class ProductData {
  String name;
  String quantity;
  int weight;
  int total;
  String totalString;

  ProductData({
    required this.name,
    required this.quantity,
    required this.weight,
    required this.total,
    required this.totalString,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      name: json['name'],
      quantity: json['quantity'],
      weight: json['weight'],
      total: json['total'],
      totalString: json['total_string'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'weight': weight,
      'total': total,
      'total_string': totalString,
    };
  }
}
