// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'chat_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: ".env");
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ChatGPT Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         useMaterial3: true,
//       ),
//       home: const ChatScreen(),
//     );
//   }
// }

import 'package:amanat_final/four_v_way/constants/constants.dart';
import 'package:amanat_final/four_v_way/providers/chats_provider.dart';
import 'package:amanat_final/four_v_way/providers/models_provider.dart';
import 'package:amanat_final/four_v_way/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter ChatBOT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          // scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: cardColor,
          ),
        ),
        home: BottomNavBarScreen(),
      ),
    );
  }
}
