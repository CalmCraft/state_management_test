import 'dart:async';

import 'package:flutter/material.dart';
import '../../welcome/welcome_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The path to local assets folder.

  late final Timer _timer;

  final chivoFontAssets = [
    "assets/font/Chivo/Chivo-Regular.ttf",
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(milliseconds: 20), () {
      for (var i = 1; i <= 3; i++) {
        precacheImage(
          Image.asset('assets/images/welcome/welcome$i.png').image,
          context,
        );
        precacheImage(
          Image.asset('assets/images/clouds/clouds$i.png').image,
          context,
        );
        precacheImage(
          Image.asset('assets/images/guitar/guitar$i.png').image,
          context,
        );
      }
      precacheImage(
        Image.asset('assets/logo/facebook.png').image,
        context,
      );
    });
  }

  /// Prefetches the given [filePath] to memory.
  Future<void> prefetchToMemory(String filePath) async {
    // if (_platformHelper.isWeb) {
    //   // We rely on browser caching here. Once the browser downloads the file,
    //   // the native implementation should be able to access it from cache.
    //   await http.get(Uri.parse('$localAssetsPrefix$filePath'));
    //   return;
    // }
    throw UnimplementedError(
      'The function `prefetchToMemory` is not implemented '
      'for platforms other than Web.',
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Chivo",
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
