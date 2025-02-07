import 'package:equatable/equatable.dart';
import 'package:mpos/features/user/bloc/edit_profile_state.dart';

abstract class EditProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateFirstName extends EditProfileEvent {
  final String firstName;
  UpdateFirstName(this.firstName);
  @override
  List<Object> get props => [firstName];
}

class UpdateLastName extends EditProfileEvent {
  final String lastName;
  UpdateLastName(this.lastName);
  @override
  List<Object> get props => [lastName];
}

class UpdateEmail extends EditProfileEvent {
  final String email;
  UpdateEmail(this.email);
  @override
  List<Object> get props => [email];
}

class UpdatePhone extends EditProfileEvent {
  final String phone;
  UpdatePhone(this.phone);
  @override
  List<Object> get props => [phone];
}

class UpdateWhatsApp extends EditProfileEvent {
  final String whatsAppNumber;
  UpdateWhatsApp(this.whatsAppNumber);
  @override
  List<Object> get props => [whatsAppNumber];
}

class UpdateAddress extends EditProfileEvent {
  final Address address;
  UpdateAddress(this.address);
  @override
  List<Object> get props => [address];
}

class UpdateDateOfBirth extends EditProfileEvent {
  final String dateOfBirth;
  UpdateDateOfBirth(this.dateOfBirth);
  @override
  List<Object> get props => [dateOfBirth];
}

class UpdateMarketingPreferences extends EditProfileEvent {
  final MarketingPreferences preferences;
  UpdateMarketingPreferences(this.preferences);
  @override
  List<Object> get props => [preferences];
}

class UpdatePaymentMethods extends EditProfileEvent {
  final List<PaymentMethod> paymentMethods;
  UpdatePaymentMethods(this.paymentMethods);
  @override
  List<Object> get props => [paymentMethods];
}

class SaveProfile extends EditProfileEvent {}