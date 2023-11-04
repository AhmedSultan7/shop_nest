import 'package:cards_app/src/core/data/remote/response/api_strings.dart';

class SettingsModel {
  final String? termsAndConditions;
  final String? privacyPolicy;
  final String? aboutUs;
  // final String? contactUs;

  SettingsModel({
    required this.termsAndConditions,
    required this.privacyPolicy,
    required this.aboutUs,
    // required this.contactUs,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    final attributes = json[ApiStrings.attributes];
    return SettingsModel(
      termsAndConditions: attributes[ApiStrings.termsAndConditions],
      privacyPolicy: attributes[ApiStrings.privacyPolicy],
      aboutUs: attributes[ApiStrings.aboutUs],
      // contactUs: attributes[ApiStrings.contactUs],
    );
  }

  factory SettingsModel.empty() => SettingsModel(
        termsAndConditions: '', privacyPolicy: '', aboutUs: '',
        // contactUs: '',
      );
}
