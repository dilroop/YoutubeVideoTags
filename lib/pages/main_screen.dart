import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:video_tags/app_theme.dart';
import 'package:video_tags/pages/main_scree_state_notifier.dart';

import '../extensions/text_style_extension.dart';
import '../localizations.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  late FocusNode editTextNode;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    editTextNode = FocusNode();
  }

  @override
  void dispose() {
    editTextNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: GradientText(
          widget.title,
          gradient: Gradients.coldLinear,
          style: GoogleFonts.damionTextTheme().headline4!.withSize(52),
        ),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final state = watch(mainScreenProvider);
          var tags = state.tags ?? [];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  urlInputHeader(theme, localization, state),
                  if (tags.isNotEmpty)
                    GradientCard(
                      gradient: AppTheme.darkGradient,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: -10,
                          spacing: 2,
                          children: [
                            ...tags.map(
                              (tag) {
                                return Chip(
                                  label: Text(
                                    tag,
                                    style: TextStyle(color: theme.colorScheme.primary),
                                  ),
                                  backgroundColor: theme.colorScheme.background,
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(80),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.copy),
                                    iconSize: 16,
                                    highlightColor: theme.primaryColor,
                                    splashColor: theme.primaryColor,
                                    focusColor: theme.primaryColor,
                                  ),
                                  color: Colors.transparent,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget urlInputHeader(ThemeData theme, AppLocalizations localization, MainScreenState state) {
    return SizedBox(
      height: 60,
      child: Card(
        color: theme.colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: TextField(
                  autofocus: true,
                  maxLines: 1,
                  controller: _controller,
                  focusNode: editTextNode,
                  style: TextStyle(
                    backgroundColor: theme.colorScheme.surface,
                    color: theme.colorScheme.onSurface,
                  ),
                  onChanged: (newText) {
                    context.read(mainScreenProvider.notifier).updateUrl(newText);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    hintText: localization.videoUrlHint,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: state.isUrlValid
                  ? () {
                      context.read(mainScreenProvider.notifier).loadTags();
                    }
                  : null,
              child: Text(
                localization.loadVideoButtonText,
                style: theme.primaryTextTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
