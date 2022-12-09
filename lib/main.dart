import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_apps/provider/auth_provider.dart';
import 'package:provider_apps/provider/counter_provider.dart';
import 'package:provider_apps/provider/example2_provider.dart';
import 'package:provider_apps/provider/item_provider.dart';
import 'package:provider_apps/screen/item_list.dart';
import 'package:provider_apps/screen/login_page.dart';
import 'package:provider_apps/screen/screen2.dart';
import 'package:provider_apps/utils/routes/routes.dart';
import 'package:provider_apps/utils/routes/routes_name.dart';
import 'package:provider_apps/view/login_screen.dart';
import 'package:provider_apps/view_model/auth_view_model.dart';
import 'screen/myhomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      /// Provider Start Learning
    ChangeNotifierProvider(create: (_) => CountProvider()),
    ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
    ChangeNotifierProvider(create: (_) => ItemProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    /// Provider End Learning
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const LoginScreen(),
        initialRoute: RoutesName.login,
       onGenerateRoute: Routes.generateRoute,
      ),
    );

  }
}

