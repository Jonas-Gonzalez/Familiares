class SanitizePublicCode {
  String call(String code) {
    final trimmed = code.trim();
    if (trimmed.length == 4 && !trimmed.contains(' ')) {
      return '${trimmed.substring(0, 2)} ${trimmed.substring(2)}';
    }
    return trimmed;
  }
}