import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muuri_app/components/pdf_viewer_component.dart';
import 'package:muuri_app/config/firebase_options.dart';
import 'package:muuri_app/pages/search_page.dart';
import 'package:muuri_app/pages/sign_in_page.dart';
import 'package:muuri_app/utils/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Constants.logger.i('Successfully connect to Firebase!');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muuri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1E5128)),
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      initialRoute: SearchPage.routeName,
      routes: {
        SearchPage.routeName: (context) => const SearchPage(),
        SignInPage.routeName: (context) => const SignInPage(),
      
      },
    );
  }
}
