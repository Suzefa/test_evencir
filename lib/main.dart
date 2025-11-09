import 'package:flutter/material.dart';
import 'package:test_evencir/test_evencir.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CustomUIOverlayConfiguration.setDefault();
  runApp(const MyApp());
}
