import 'package:trans/Translation.dart';

class TranslationSimple implements Translation {
  @override
  String language;

  @override
  String value;

  @override
  String key;

  TranslationSimple(this.key, this.language, this.value);

  factory TranslationSimple.fromJson(dynamic json){
    return TranslationSimple(json['key'], json['lang'], json['value']);
  }

  @override
  String getTranslation({payload}) {
    return value;
  }
}
