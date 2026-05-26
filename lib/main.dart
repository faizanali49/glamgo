import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  // Ensure framework services are bound before mounting widgets
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // ProviderScope is mandatory at the absolute root layer to host Riverpod state container trees
    const ProviderScope(child: GlamGoApp()),
  );
}
