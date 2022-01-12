import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static const key = 'customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 10),
      maxNrOfCacheObjects: 150,
      fileService: HttpFileService(),
    ),
  );
}
