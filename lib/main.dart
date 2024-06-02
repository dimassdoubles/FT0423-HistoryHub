import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';
import 'package:history_hub_v2/main_binding.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(HiveDatasource.boxName);

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_KEY"]!,
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Application",
          initialBinding: MainBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        );
      },
    ),
  );
}
