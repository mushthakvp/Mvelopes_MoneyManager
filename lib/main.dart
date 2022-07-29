import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvelopes/view/splash_screen/splash_screen.dart';
import 'package:mvelopes/viewmodel/add_edit/add_edit_pov.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:mvelopes/viewmodel/home/tapbar_pov.dart';
import 'package:provider/provider.dart';
import 'model/add_edit/model/add_edit.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TransationModelAdapter().typeId)) {
    Hive.registerAdapter(TransationModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TapBarPov(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AddEditPov(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HiveImpl(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
