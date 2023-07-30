List<String> getRucPrefixes() {
  return ["10", "15", "17", "20"];
}

bool isRUCValid(String ruc) {
  final List<int> multipliers = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2];
  final List<String> prefixes = getRucPrefixes();
  final int length = multipliers.length + 1;

  if (ruc.length != length) {
    return false;
  }

  bool isPrefixOk = false;

  for (String prefix in prefixes) {
    if (ruc.substring(0, 2) == prefix) {
      isPrefixOk = true;
      break;
    }
  }

  if (!isPrefixOk) {
    return false;
  }

  int sum = 0;

  for (int i = 0; i < multipliers.length; i++) {
    final String section = ruc[i];

    if (int.tryParse(section) == null) {
      return false;
    }

    sum += int.parse(ruc[i]) * multipliers[i];
  }

  final int rest = sum % length;
  final String response = "${length - rest}";

  return response[response.length - 1] == ruc[ruc.length - 1];
}
