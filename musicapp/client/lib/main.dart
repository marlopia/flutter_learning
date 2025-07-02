import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/features/auth/repositories/auth_local_repository.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:client/features/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:client/core/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authLocalRepo = AuthLocalRepository();
  await authLocalRepo.init();

  final container = ProviderContainer(
    overrides: [authLocalRepositoryProvider.overrideWithValue(authLocalRepo)],
  );

  final notifier = container.read(authViewModelProvider.notifier);
  await notifier.getData();

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserNotifierProvider);

    return MaterialApp(
      title: 'Music App',
      theme: AppTheme.darkThemeMode,
      home: currentUser == null ? SignupPage() : HomePage(),
    );
  }
}
