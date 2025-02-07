class ProductDataModel {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final int quantity;

  ProductDataModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required id,
  });

  ProductDataModel copyWith({
    String? name,
    String? description,
    String? imageUrl,
    double? price,
    int? quantity,
  }) {
    return ProductDataModel(
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      id: null,
    );
  }
}
