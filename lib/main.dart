import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ga_gold/app/app.dart';
import 'package:ga_gold/app/navigators/navigators.dart';
import 'package:ga_gold/data/data.dart';
import 'package:ga_gold/device/device.dart';
import 'package:ga_gold/device/repositories/device_repositories.dart';
import 'package:ga_gold/domain/domain.dart';
import 'package:ga_gold/domain/services/firebase_api.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:upgrader/upgrader.dart';

import 'firebase_options.dart';

final noScreenshot = NoScreenshot.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseApi.initilizeNotification();
  Utility.disableScreenshot(noScreenshot);
  runApp(
    MyApp(),
  );
}

Future<void> initServices() async {
  await Hive.initFlutter();

  Get.put(
    Repository(
      Get.put(
        DeviceRepository(),
        permanent: true,
      ),
      Get.put(
          DataRepository(
            Get.put(
              ConnectHelper(),
              permanent: true,
            ),
          ),
          permanent: true),
    ),
  );

  /// Services
  await Get.putAsync(() => CommonService().init());
  await Get.putAsync(() => DbService().init());
}

class DbService extends GetxService {
  Future<DbService> init() async {
    await Get.find<DeviceRepository>().init();
    return this;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: ColorsValue.primaryColor,
      ),
    );

    final Upgrader upgrader = Upgrader(debugLogging: kDebugMode);

    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 745),
      builder: (_, child) => UpgradeAlert(
        dialogStyle: Platform.isAndroid
            ? UpgradeDialogStyle.material
            : UpgradeDialogStyle.cupertino,
        upgrader: upgrader,
        child: GetMaterialApp(
          locale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          title: StringConstants.appName,
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: ThemeMode.light,
          getPages: AppPages.pages,
          initialRoute: Routes.splashScreen,
          translations: TranslationsFile(),
          enableLog: true,
        ),
      ),
    );
  }
}
