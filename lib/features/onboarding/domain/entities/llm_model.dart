class LLMModelEntity {
  final List<Models> models;
  final Voices voices;

  const LLMModelEntity({required this.models, required this.voices});
}

class Models {
  final String id;
  final String type;
  final String displayName;
  final String url;
  final int sizeBytes;

  const Models({
    required this.id,
    required this.displayName,
    required this.sizeBytes,
    required this.type,
    required this.url,
  });
}

class Voices {
  final String displayName;
  final int sizeBytes;
  final List<VoiceModel> voiceModel;

  const Voices({
    required this.displayName,
    required this.sizeBytes,
    required this.voiceModel,
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
