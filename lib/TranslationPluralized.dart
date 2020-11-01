import 'package:trans/Translation.dart';

class TranslationPluralized implements Translation
{
  @override
  String language;

  @override
  String value;

  List values;

  bool pluralize;

  @override
  String key;

  TranslationPluralized(this.key, this.language, this.pluralize, this.values);

  factory TranslationPluralized.fromJson(dynamic json) {
    return TranslationPluralized(
        json['key'],
        json['lang'],
        json['pluralize'] as bool,
        json['values'] as List
    );
  }

  @override
  String getTranslation({payload}) {
    var value = int.parse(payload);
    // https://www.nulled.cc/threads/44272/
    // https://www.sql.ru/forum/524746/ostalos-dney-dnya-den
    // I'm too lazy, can't explain simple algorithm c
    var form;
    var count = value % 100;
    if (count >= 5 && count <= 20) { form = 2; }
    else {
      count = count % 10;
      if (count == 1) { form = 0; }
      else if (count >= 2 && count <= 4) { form = 1; }
      else { form = 2; }
    }

    return values[form].replaceAll(RegExp(r'%s'), payload);
  }
}