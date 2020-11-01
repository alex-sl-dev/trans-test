abstract class Translation {
  final String key;
  final String language;
  final String value;

  Translation(this.key, this.language, this.value);

  String getTranslation({payload}) {
    return '';
  }


}

