import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path_provider.getApplicationDocumentsDirectory();

  await Hive.initFlutter(dir.path);

  await Hive.openBox(HiveStrings.auctionCache);

  runApp(ProviderScope(child: MyApp()));
}
