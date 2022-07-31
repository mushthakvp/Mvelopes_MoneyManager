import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvelopes/viewmodel/add_edit/add_edit_pov.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:mvelopes/viewmodel/home/home_pov.dart';
import 'package:mvelopes/viewmodel/home/tapbar_pov.dart';
import 'package:mvelopes/viewmodel/pie_chart/pie_chart_pov.dart';
import 'package:provider/provider.dart';
import 'model/add_edit/model/add_edit.dart';
import 'view/splash/splash_screen.dart';
import 'viewmodel/settings/settings_pov.dart';
import 'viewmodel/view_more/view_more_pov.dart';
import 'package:timezone/data/latest_all.dart' as tz;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TransationModelAdapter().typeId)) {
    Hive.registerAdapter(TransationModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  AwesomeNotifications().initialize(
    'resource://drawable/logo',
    [
      NotificationChannel(
        playSound: false,
        enableVibration: false,
        icon: 'resource://drawable/logo',
        channelKey: 'persistent_notification',
        channelName: 'Persistent Notification',
        channelDescription: 'Showing permanent notification',
        importance: NotificationImportance.Max,
        channelShowBadge: true,
      )
    ],
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
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
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HomePov(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ViewMorePov(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PieChartPov(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsPov(),
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
