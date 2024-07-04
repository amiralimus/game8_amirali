import 'dart:convert';

class Game8Model {
  String incompleteWord;
  String completeWord;
  String completeWordAudio;
  String correctOptionImageAttachedState;
  List<List<dynamic>> optionArray;
  String gif;
  String promptAudio1;
  String promptAudio2;

  Game8Model({
    required this.incompleteWord,
    required this.completeWord,
    required this.completeWordAudio,
    required this.correctOptionImageAttachedState,
    required this.optionArray,
    required this.gif,
    required this.promptAudio1,
    required this.promptAudio2,
  });

  factory Game8Model.fromRawJson(String str) => Game8Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Game8Model.fromJson(Map<String, dynamic> json) => Game8Model(
    incompleteWord: json["incompleteWord"],
    completeWord: json["completeWord"],
    completeWordAudio: json["completeWordAudio"],
    correctOptionImageAttachedState: json["correctOptionImageAttachedState"],
    optionArray: List<List<dynamic>>.from(json["optionArray"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    gif: json["gif"],
    promptAudio1: json["promptAudio1"],
    promptAudio2: json["promptAudio2"],
  );

  Map<String, dynamic> toJson() => {
    "incompleteWord": incompleteWord,
    "completeWord": completeWord,
    "completeWordAudio": completeWordAudio,
    "correctOptionImageAttachedState": correctOptionImageAttachedState,
    "optionArray": List<dynamic>.from(optionArray.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "gif": gif,
    "promptAudio1": promptAudio1,
    "promptAudio2": promptAudio2,
  };
}