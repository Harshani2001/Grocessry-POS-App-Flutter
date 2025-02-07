import 'package:bloc/bloc.dart';
import 'add_item_event.dart';
import 'add_item_state.dart';

class AddFoodBloc extends Bloc<AddFoodEvent, AddFoodState> {
  AddFoodBloc() : super(AddFoodInitial()) {
    on<PickImageEvent>((event, emit) async {
      try {
        // Simulate image picking logic
        final pickedImagePath = 'path/to/image.jpg'; // Replace with actual logic
        emit(ImagePickedState(pickedImagePath));
      } catch (e) {
        emit(AddFoodFailure("Failed to pick image"));
      }
    });

    on<SubmitFormEvent>((event, emit) async {
      emit(AddFoodLoading());
      try {
        // Simulate form submission
        await Future.delayed(const Duration(seconds: 2)); // Simulate a network request
        emit(AddFoodSuccess("Food item added successfully!"));
      } catch (e) {
        emit(AddFoodFailure("Failed to add food item"));
      }
    });
  }
}
 