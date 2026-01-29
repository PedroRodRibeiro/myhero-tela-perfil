import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:heros/core/network/auth_interceptor.dart';
import 'package:heros/core/network/dio_client.dart';
import 'package:heros/core/security/secure_token_provider.dart';
import 'package:heros/core/security/token_provider.dart';
import 'package:heros/core/network/http_client.dart';
import 'package:heros/data/repositories/dio_http_client_impl.dart';
import 'package:heros/data/repositories/heros_repository_impl.dart';
import 'package:heros/domain/repositories/heros_repository.dart';
import 'package:heros/ui/home/hero_profile.dart';
import 'package:heros/ui/home/hero_viewmodel.dart';
import 'package:heros/ui/home/list_hero.dart';
import 'package:provider/provider.dart';

import 'core/services/secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = const FlutterSecureStorage();

  await storage.write(
    key: SecureStorage.token,
    value: '3f5baa4ff6e9f8f11562c4539d4329e4',
  );

  final tokenProvider = SecureTokenProvider(storage);
  final authInterceptor = AuthInterceptor(tokenProvider);
  final dioClient = DioClient(authInterceptor: authInterceptor);
  final dioHttpClient = DioHttpClient(dioClient.dio);

  runApp(
    MultiProvider(
      providers: [
        Provider<TokenProvider>.value(value: tokenProvider),
        Provider<HttpClient>.value(value: dioHttpClient),
        Provider<HerosRepository>(
          create: (context) => HerosRepositoryImpl(context.read<HttpClient>()),
        ),
        Provider(
          create: (context) => HeroViewModel(context.read<HerosRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heros',
      initialRoute: '/',
      routes: {
        '/': (context) =>
            ListHero(heroViewModel: context.read<HeroViewModel>()),
        '/profile': (context) =>
            HeroProfile(heroViewModel: context.read<HeroViewModel>()),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
