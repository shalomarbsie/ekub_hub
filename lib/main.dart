import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(child: EqubHubApp()));
}

class EqubHubApp extends StatelessWidget {
  const EqubHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Equb Hub', routerConfig: appRouter);
  }
}
