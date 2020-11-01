import 'dart:convert';
import 'dart:html';

import 'package:trans/Dictionary.dart';
import 'package:trans/Translation.dart';
import 'package:trans/Translator.dart';

void main() {

  var json = '{ "translations": [ { "lang": "ru", "key": "hello", "value": "Привет" }, { "lang": "ua", "key": "hello", "value": "Привіт" }, { "lang": "ru", "key": "hello %s", "value": "Привет %s!" }, { "lang": "ua", "key": "hello %s", "value": "Привіт %s!" }, { "lang": "ru", "key": "%s #day", "pluralize": true, "values": ["%s день", "%s дня", "%s дней"] }, { "lang": "ua", "key": "%s #day", "pluralize": true, "values": ["%s день", "%s дні", "%s днів"] } ]}';
  var translator = Translator(Dictionary.fromJson(jsonDecode(json)));

  translator.setLang('ua');

  print(translator.translate('hello')); // Привіт
  print(translator.translate('hello %s', payload: 'user')); // Привіт user
  print(translator.translate('%s #day', payload: '10')); // 10 днів
  print(translator.translate('%s #day', payload: '1')); // 1 день
  print(translator.translate('%s #day', payload: '3')); // 3 дні

  translator.setLang('ru');

  print(translator.translate('hello')); // Привет
  print(translator.translate('hello %s', payload: 'user')); // Привіт user
  print(translator.translate('%s #day', payload: '10')); // 10 днів
  print(translator.translate('%s #day', payload: '1')); // 1 день
  print(translator.translate('%s #day', payload: '3')); // 3 дні

  querySelector('#output').text = 'Your Dart app is running.';
}
