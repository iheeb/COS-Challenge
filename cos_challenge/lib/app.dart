import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/core/utils/app_theme.dart';
import 'package:cos_challenge/features/auth/application/user_provider.dart';
import 'package:cos_challenge/features/auth/presentation/screens/user_id_screen.dart';
import 'package:cos_challenge/features/vin_input/presentation/screens/vin_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdAsync = ref.watch(userIdProvider);

    return MaterialApp(
      title: 'CarOnSale Flutter Challenge',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: userIdAsync.when(
        data: (userId) => userId == null ? UserIdScreen() : VinInputScreen(),
        loading:
            () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
        error:
            (e, _) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Text(UserIdStrings.userLoadingError + e.toString()),
                ),
              ),
            ),
      ),
    );
  }
}
