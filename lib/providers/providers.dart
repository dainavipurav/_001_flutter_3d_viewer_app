import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filePathStateProvider = StateProvider<String>((ref) {
  return '';
});

final webViewControllerProvider =
    StateProvider<InAppWebViewController?>((ref) => null);

// final fileRepositoryProvider = Provider(
//   (ref) => FileRepository(),
// );

// final futureProvider = FutureProvider.family(
//   (ref, arg) async {
//     final repository = ref.watch(fileRepositoryProvider);
//     final List<int> fileByteArray = await repository.importFileInByteArray();
//     return fileByteArray;
//   },
// );

final loadingValueProvider = StateProvider<bool>(
  (ref) => false,
);

final errorValueProvider = StateProvider<String?>(
  (ref) => null,
);
