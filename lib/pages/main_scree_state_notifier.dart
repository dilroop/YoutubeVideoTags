import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

final mainScreenProvider = StateNotifierProvider.autoDispose<MainScreenViewModel, MainScreenState>((ref) {
  // basically like viewModel factory
  return MainScreenViewModel(MainScreenState(url: "www.google.com"));
});

class MainScreenViewModel extends StateNotifier<MainScreenState> {
  MainScreenViewModel(MainScreenState state) : super(state);

  void loadTags() async {
    var url = Uri.parse(state.url!);
    var response = await http.get(url);
    print(response.body);
    //<meta name="keywords" content="two minute papers, technology, science, fluid simulation, duck simulation, fluids">
    // "keywords": ["two minute papers", "technology", "science", "fluid simulation", "duck simulation", "fluids"],
  }

  void updateUrl(String newText) {
    var urlPattern = r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
    var isUrlValid = new RegExp(urlPattern, caseSensitive: false).firstMatch(newText) != null;

    state = MainScreenState(url: newText, tags: state.tags, isUrlValid: isUrlValid);
    print(Uri.parse(newText).isAbsolute);
  }
}

class MainScreenState {
  List<String>? tags;
  String? url;
  bool isUrlValid = false;

  MainScreenState({this.url, this.tags, this.isUrlValid = false});
}
