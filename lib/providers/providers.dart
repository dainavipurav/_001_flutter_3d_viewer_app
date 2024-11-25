import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filePathStateProvider = StateProvider<String>((ref) {
  return '';
});

final webViewControllerProvider =
    StateProvider<InAppWebViewController?>((ref) => null);
