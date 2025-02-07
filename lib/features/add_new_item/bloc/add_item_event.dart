abstract class AddFoodEvent {}

class PickImageEvent extends AddFoodEvent {}

class SubmitFormEvent extends AddFoodEvent {
  final String name;
  final String price;
  final String description;
  final String unit;
  final DateTime? expiryDate;
  final String subcategory;
  final String? imagePath;

  SubmitFormEvent({
    required this.name,
    required this.price,
    required this.description,
    required this.unit,
    required this.expiryDate,
    required this.subcategory,
    this.imagePath,
  });
}
