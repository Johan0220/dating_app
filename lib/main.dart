import 'package:dating_app/features/auth/data/auth_api_client.dart';
import 'package:dating_app/features/auth/data/auth_local.data_source.dart';
import 'package:dating_app/features/auth/data/auth_repository.dart';
import 'package:dating_app/main_screen.dart';
import 'package:dating_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/auth/auth_bloc.dart';
import 'config/http_client.dart';
import 'finding_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final spf = await SharedPreferences.getInstance();
  runApp(MyApp(
      sharedPreferences : spf,
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
          authApiClient: AuthApiClient(dio),
          authLocalDataSource: AuthLocalDataSource(sharedPreferences),
      ),
      child: BlocProvider(
          create: (context) => AuthBloc(context.read<AuthRepository>()),
          child:MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.light(
                  background: Colors.blueGrey.shade50,
                  onBackground: Colors.black,
                  primary: const Color(0xFFFe3c72),
                  onPrimary: Colors.black,
                  secondary: const Color(0xFF424242),
                  onSecondary: Colors.white,
                  tertiary: const Color.fromRGBO(255, 204, 128, 1),
                  error: Colors.red,
                  outline: const Color(0xFF424242)
              ),
              useMaterial3: true,
            ),
            home: FindingScreen(),
            debugShowCheckedModeBanner: false,
          )
      ),
    );

  }
}



