import 'package:flutter/material.dart';
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
    var body = response.body;
    var methodOneStart = "<meta name=\"keywords\" content=\"";
    var methodOneEnd = "\">";

    var methodTwoStart = "\"keywords\": [";
    var methodTwoEnd = "]";

    var methodOneResult = _getContentBetween(body, methodOneStart, methodOneEnd);
    if (methodOneResult == null) {
      var methodTwoResult = _getContentBetween(body, methodTwoStart, methodTwoEnd);
      if (methodTwoResult == null) {
        // handle failed case
        // unable to find tags
      } else {
        var tags = methodTwoResult.split(",").map((tag) => tag.replaceAll("\"", "").trim()).toList();
        _updateTags(tags);
      }
    } else {
      var tags = methodOneResult.split(",").map((tag) => tag.trim()).toList();
      _updateTags(tags);
    }

    //<meta name="keywords" content="two minute papers, technology, science, fluid simulation, duck simulation, fluids">
    // "keywords": ["two minute papers", "technology", "science", "fluid simulation", "duck simulation", "fluids"],
  }

  void _updateTags(List<String> tags) {
    print(tags.toString());
    state = MainScreenState(url: state.url, tags: tags, isUrlValid: state.isUrlValid);
  }

  String? _getContentBetween(String lookIn, String start, String end) {
    var startIndex = lookIn.indexOf(start) + start.length;
    if (startIndex == -1) return null;
    var endIndex = lookIn.indexOf(end, startIndex);
    if (endIndex == -1) return null;
    return lookIn.substring(startIndex, endIndex);
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
