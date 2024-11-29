import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zarity_project/firebase_options.dart';
import 'package:zarity_project/providers/firebase_provider.dart';
import 'package:zarity_project/screens/blog_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: GoogleFonts.poppinsTextTheme(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FirebaseProvider(),
        ),
      ],
      child:  MaterialApp(
        theme: theme,
        home: const BlogTab(),
      ),
    );
  }
}
