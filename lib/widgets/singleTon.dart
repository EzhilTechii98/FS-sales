class MFRIFlashSingleton {

  String? bearerToken;
  String? sessionToken;
  bool? isUpdated = false;
  bool? isProjectUpdate = false;

  static final MFRIFlashSingleton _singleton =
  MFRIFlashSingleton._internal();

  MFRIFlashSingleton._internal();

  static MFRIFlashSingleton get instance => _singleton;
}
