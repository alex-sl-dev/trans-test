import 'package:trans/Translation.dart';

class TranslationPlaceholder implements Translation{
  @override
  String language;

  @override
  String value;

  @override
  String key;

  TranslationPlaceholder(this.key, this.language, this.value);

  factory TranslationPlaceholder.fromJson(dynamic json) {
    return TranslationPlaceholder(json['key'], json['lang'], json['value']);
  }

  @override
  String getTranslation({payload}) {
    return value.replaceAll(RegExp(r'%s'), payload);
  }
}