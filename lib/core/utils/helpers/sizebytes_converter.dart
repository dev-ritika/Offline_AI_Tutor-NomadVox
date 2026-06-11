class SizebytesConverter {
  static String getSize(int sizeBytes) {
    const kb = 1024;
    const mb = kb * 1024;
    const gb = mb * 1024;

    if (sizeBytes >= gb) {
      return "${(sizeBytes / gb).toStringAsFixed(1)} GB";
    } else if (sizeBytes >= mb) {
      return "${(sizeBytes / mb).toStringAsFixed(1)} MB";
    } else if (sizeBytes >= kb) {
      return "${(sizeBytes / kb).toStringAsFixed(1)} KB";
    } else {
      return "$sizeBytes B";
    }
  }
}
