import 'package:trans/Dictionary.dart';

class Translator {

  final Dictionary dict;
  String currentLang;

  Translator(this.dict);

  String translate(String translationID, {dynamic payload}) {
    return dict.getTranslation(translationID, currentLang, payload);
  }

  void setLang(String s) {
    currentLang = s;
  }
}