import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_profile_event.dart';
import 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(const EditProfileState()) {
    on<UpdateFirstName>((event, emit) {
      emit(state.copyWith(firstName: event.firstName));
    });

    on<UpdateLastName>((event, emit) {
      emit(state.copyWith(lastName: event.lastName));
    });

    on<UpdateEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<UpdatePhone>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<UpdateWhatsApp>((event, emit) {
      emit(state.copyWith(whatsAppNumber: event.whatsAppNumber));
    });

    on<UpdateAddress>((event, emit) {
      emit(state.copyWith(address: event.address));
    });

    on<UpdateDateOfBirth>((event, emit) {
      emit(state.copyWith(dateOfBirth: event.dateOfBirth));
    });

    on<UpdateMarketingPreferences>((event, emit) {
      emit(state.copyWith(marketingPreferences: event.preferences));
    });

    on<UpdatePaymentMethods>((event, emit) {
      emit(state.copyWith(paymentMethods: event.paymentMethods));
    });

    on<SaveProfile>((event, emit) {
      emit(state.copyWith(isSaved: true));
    });
  }
}
