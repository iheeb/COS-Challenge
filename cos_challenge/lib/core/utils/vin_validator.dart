import 'package:cos_challenge/core/utils/app_strings.dart';

class VinValidator {
  static String? validate(String? value) {
    final vinRegex = RegExp(r'^[A-HJ-NPR-Z0-9]{17}$');
    if (value == null || value.isEmpty) return VinInputStrings.vinEmpty;
    if (!vinRegex.hasMatch(value)) {
      return VinInputStrings.vinInvalid;
    }
    return null;
  }
}
