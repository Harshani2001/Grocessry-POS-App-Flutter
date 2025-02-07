abstract class AddFoodState {}

class AddFoodInitial extends AddFoodState {}

class AddFoodLoading extends AddFoodState {}

class AddFoodSuccess extends AddFoodState {
  final String message;
  AddFoodSuccess(this.message);
}

class AddFoodFailure extends AddFoodState {
  final String error;
  AddFoodFailure(this.error);
}

class ImagePickedState extends AddFoodState {
  final String imagePath;
  ImagePickedState(this.imagePath);
}
