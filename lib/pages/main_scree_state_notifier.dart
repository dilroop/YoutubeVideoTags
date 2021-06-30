import 'package:riverpod/riverpod.dart';

final mainScreenProvider = StateNotifierProvider.autoDispose<MainScreenViewModel, MainScreenState>((ref) {
  // basically like viewModel factory
  return MainScreenViewModel(MainScreenState(url: "www.google.com"));
});

class MainScreenViewModel extends StateNotifier<MainScreenState> {
  MainScreenViewModel(MainScreenState state) : super(state);

  void loadTags() {}

  void updateUrl(String newText) {
    state.url = newText;
  }
}

class MainScreenState {
  List<String>? tags;
  String? url;

  MainScreenState({this.url, this.tags});
}
