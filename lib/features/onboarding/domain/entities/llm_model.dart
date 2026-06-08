class LLMModelEntity {
  final List<Models> models;

  const LLMModelEntity({required this.models});
}

class Models {
  final String id;
  final String type;
  final String displayName;
  final String subtitleDisplay;
  final String? url;
  final int sizeBytes;
  final List<VoiceModel>? voices;

  const Models({
    required this.id,
    required this.displayName,
    required this.subtitleDisplay,
    required this.sizeBytes,
    required this.type,
    required this.url,
    required this.voices,
  });
}

class VoiceModel {
  final String id;
  final String onnx;
  final String config;
  final String displayName;

  VoiceModel({
    required this.config,
    required this.displayName,
    required this.id,
    required this.onnx,
  });
}
