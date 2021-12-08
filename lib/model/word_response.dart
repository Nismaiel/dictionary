// To parse this JSON data, do
//
//     final wordResponse = wordResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class WordResponse {
  WordResponse({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.origin,
    required this.meanings,
  });

  final String word;
  final String phonetic;
  final List<Phonetic> phonetics;
  final String origin;
  final List<Meaning> meanings;

  factory WordResponse.fromJson(String str) => WordResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WordResponse.fromMap(Map<String, dynamic> json) => WordResponse(
    word: json["word"],
    phonetic: json["phonetic"],
    phonetics: List<Phonetic>.from(json["phonetics"].map((x) => Phonetic.fromMap(x))),
    origin: json["origin"],
    meanings: List<Meaning>.from(json["meanings"].map((x) => Meaning.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "word": word,
    "phonetic": phonetic,
    "phonetics": List<dynamic>.from(phonetics.map((x) => x.toMap())),
    "origin": origin,
    "meanings": List<dynamic>.from(meanings.map((x) => x.toMap())),
  };
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  final String partOfSpeech;
  final List<Definition> definitions;

  factory Meaning.fromJson(String str) => Meaning.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meaning.fromMap(Map<String, dynamic> json) => Meaning(
    partOfSpeech: json["partOfSpeech"],
    definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "partOfSpeech": partOfSpeech,
    "definitions": List<dynamic>.from(definitions.map((x) => x.toMap())),
  };
}

class Definition {
  Definition({
    required this.definition,
    required this.example,
    required this.synonyms,
    required this.antonyms,
  });

  final String definition;
  final String example;
  final List<String> synonyms;
  final List<dynamic> antonyms;

  factory Definition.fromJson(String str) => Definition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Definition.fromMap(Map<String, dynamic> json) => Definition(
    definition: json["definition"],
    example: json["example"],
    synonyms: List<String>.from(json["synonyms"].map((x) => x)),
    antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "definition": definition,
    "example": example,
    "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
    "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
  };
}

class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
  });

  final String text;
  final String audio;

  factory Phonetic.fromJson(String str) => Phonetic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Phonetic.fromMap(Map<String, dynamic> json) => Phonetic(
    text: json["text"],
    audio: json["audio"],
  );

  Map<String, dynamic> toMap() => {
    "text": text,
    "audio": audio,
  };
}
