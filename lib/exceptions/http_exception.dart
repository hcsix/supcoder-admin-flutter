import 'dart:convert';

class SupcoderHttpException implements Exception {
  Map<String, dynamic>? errors;

  SupcoderHttpException(dynamic responseBody) {
    if (responseBody == null) {
      errors = {
        'unknown_error':
            'An unknown error occurred, no further information available'
      };
    } else {
      try {
        final response = json.decode(responseBody);
        errors = (response is Map ? response : {'unknown_error': response})
            .cast<String, dynamic>();
      } catch (e) {
        errors = {'unknown_error': responseBody};
      }
    }
  }

  @override
  String toString() {
    return errors!.values.toList().join(', ');
  }
}
