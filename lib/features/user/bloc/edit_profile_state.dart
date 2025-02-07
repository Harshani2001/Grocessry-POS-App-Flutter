import 'package:equatable/equatable.dart';

class EditProfileState extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String whatsAppNumber;
  final Address address;
  final String dateOfBirth;
  final String customerType;
  final double creditLimit;
  final int loyaltyPoints;
  final String preferredLanguage;
  final MarketingPreferences marketingPreferences;
  final List<PaymentMethod> paymentMethods;
  final String profileImageUrl;
  final String status;
  final bool obscurePassword;
  final bool isSaved;

  const EditProfileState({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.phone = '',
    this.whatsAppNumber = '',
    this.address = const Address(),
    this.dateOfBirth = '',
    this.customerType = 'Retail',
    this.creditLimit = 0.0,
    this.loyaltyPoints = 0,
    this.preferredLanguage = 'English',
    this.marketingPreferences = const MarketingPreferences(),
    this.paymentMethods = const [],
    this.profileImageUrl = '',
    this.status = 'Active',
    this.obscurePassword = true,
    this.isSaved = false,
  });

  EditProfileState copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    String? whatsAppNumber,
    Address? address,
    String? dateOfBirth,
    String? customerType,
    double? creditLimit,
    int? loyaltyPoints,
    String? preferredLanguage,
    MarketingPreferences? marketingPreferences,
    List<PaymentMethod>? paymentMethods,
    String? profileImageUrl,
    String? status,
    bool? obscurePassword,
    bool? isSaved,
  }) {
    return EditProfileState(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      customerType: customerType ?? this.customerType,
      creditLimit: creditLimit ?? this.creditLimit,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      marketingPreferences: marketingPreferences ?? this.marketingPreferences,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      status: status ?? this.status,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        password,
        phone,
        whatsAppNumber,
        address,
        dateOfBirth,
        customerType,
        creditLimit,
        loyaltyPoints,
        preferredLanguage,
        marketingPreferences,
        paymentMethods,
        profileImageUrl,
        status,
        obscurePassword,
        isSaved,
      ];
}

class Address extends Equatable {
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  const Address({
    this.street = '',
    this.city = '',
    this.state = '',
    this.zipCode = '',
    this.country = '',
  });

  @override
  List<Object?> get props => [street, city, state, zipCode, country];
}

class MarketingPreferences extends Equatable {
  final bool emailNotifications;
  final bool smsNotifications;
  final String preferredContactMethod;

  const MarketingPreferences({
    this.emailNotifications = true,
    this.smsNotifications = false,
    this.preferredContactMethod = 'email',
  });

  @override
  List<Object?> get props => [
        emailNotifications,
        smsNotifications,
        preferredContactMethod,
      ];
}

class PaymentMethod extends Equatable {
  final String cardType;
  final String cardNumber;
  final String expiryDate;
  final Address? billingAddress;

  const PaymentMethod({
    this.cardType = '',
    this.cardNumber = '',
    this.expiryDate = '',
    this.billingAddress,
  });

  @override
  List<Object?> get props => [cardType, cardNumber, expiryDate, billingAddress];
}