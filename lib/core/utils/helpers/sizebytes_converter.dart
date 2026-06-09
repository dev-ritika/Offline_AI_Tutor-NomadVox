class SizebytesConverter {
  static String getSize(int sizeBytes) {
    const kb = 1024;
    const mb = kb * 1024;
    const gb = mb * 1024;

    if (sizeBytes > kb && sizeBytes <= mb) {
      return "${(sizeBytes / kb).toStringAsFixed(1)} KB";
    } else if (sizeBytes > mb && sizeBytes <= gb) {
      return "${(sizeBytes / mb).toStringAsFixed(1)} MB";
    } else {
      return "${(sizeBytes / gb).toStringAsFixed(1)} GB";
    }
  }
}
