import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamy/app.dart';
import 'package:teamy/components/service/study_service.dart';
import 'package:teamy/firebase_options.dart';
import 'package:teamy/pages/account/email_auth.dart';
import 'package:teamy/pages/account/email_login.dart';
import 'package:teamy/pages/test/new_study_status.dart';
import 'package:teamy/theme/style.dart' as style;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => EmailAuth()),
          ChangeNotifierProvider(create: (context) => StudyService()),
        ],
        child: MaterialApp(
            theme: style.theme,
            debugShowCheckedModeBanner: false,
            home: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<EmailAuth>().currentUser();
    return user == null ? EmailLoginPage() : App();
  }
}
