import 'package:trans/TranslationPlaceholder.dart';
import 'package:trans/TranslationPluralized.dart';
import 'package:trans/Translation.dart';
import 'package:trans/TranslationSimple.dart';

class Dictionary {

  List<Translation> vocabulary;

  Dictionary();

  factory Dictionary.fromJson(Map<String, Object> json){
    var dict = Dictionary();
    var listOfTranslations = json['translations'] as List;

    dict.vocabulary = listOfTranslations.map((e)  {
      if (e.containsKey('value') && e['value'].contains('%s')) {
        return TranslationPlaceholder.fromJson(e);
      } else if (e.containsKey('pluralize') && e['pluralize']) {
        return TranslationPluralized.fromJson(e);
      } else {
        return TranslationSimple.fromJson(e);
      }
    }).toList();

    return dict;
  }

  String getTranslation(String translationID, String lang, dynamic payload) {
    var matches = vocabulary.where((element) =>
      element.key == translationID && element.language == lang);

    if (matches.isEmpty) return 'Not found';

    return matches.first.getTranslation(payload: payload);
  }
}


