import 'dart:convert';

LlmModel llmModelFromJson(String str) => LlmModel.fromJson(json.decode(str));

String llmModelToJson(LlmModel data) => json.encode(data.toJson());

class LlmModel {
  String version;
  List<Model> models;
  Voices voices;

  LlmModel({required this.version, required this.models, required this.voices});

  factory LlmModel.fromJson(Map<String, dynamic> json) => LlmModel(
    version: json["version"],
    models: List<Model>.from(json["models"].map((x) => Model.fromJson(x))),
    voices: Voices.fromJson(json["voices"]),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "models": List<dynamic>.from(models.map((x) => x.toJson())),
    "voices": voices.toJson(),
  };
}

class Model {
  String id;
  String type;
  String displayName;
  int sizeBytes;
  String url;

  Model({
    required this.id,
    required this.type,
    required this.displayName,
    required this.sizeBytes,
    required this.url,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    type: json["type"],
    displayName: json["displayName"],
    sizeBytes: json["sizeBytes"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "displayName": displayName,
    "sizeBytes": sizeBytes,
    "url": url,
  };
}

class Voices {
  String displayName;
  int sizeBytes;
  List<Item> items;

  Voices({
    required this.displayName,
    required this.sizeBytes,
    required this.items,
  });

  factory Voices.fromJson(Map<String, dynamic> json) => Voices(
    displayName: json["displayName"],
    sizeBytes: json["sizeBytes"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "displayName": displayName,
    "sizeBytes": sizeBytes,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String id;
  String displayName;
  String onnx;
  String config;

  Item({
    required this.id,
    required this.displayName,
    required this.onnx,
    required this.config,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    displayName: json["displayName"],
    onnx: json["onnx"],
    config: json["config"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "displayName": displayName,
    "onnx": onnx,
    "config": config,
  };
}
