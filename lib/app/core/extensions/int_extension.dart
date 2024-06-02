extension IntExtension on int? {
  String toIDR() {
    if (this == null) return '';
    String formattedString = this!.toString();
    String result = '';
    while (formattedString.length > 3) {
      result =
          '.${formattedString.substring(formattedString.length - 3)}$result';
      formattedString =
          formattedString.substring(0, formattedString.length - 3);
    }
    result = formattedString + result;
    return 'IDR $result';
  }
}
