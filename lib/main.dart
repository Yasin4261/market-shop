import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:market_shop/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'views/auth_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Market Shop',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const AuthPage(),
      ),
    );
  }
}
