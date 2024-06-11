DateTime? parseDateTime(String? dateTimeStr) {
  if (dateTimeStr?.isNotEmpty ?? false) {
    return DateTime.tryParse(dateTimeStr!);
  }

  return null;
}
