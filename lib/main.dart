import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marvel/core/exports.dart';
import 'package:marvel/splash_page.dart';

void main() async {
  await GetStorage.init();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayColor: Colors.black.withOpacity(.5),
          overlayWidget: Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          ),
          child: GetMaterialApp(
            title: Strings.appName,
            home: const SplashPage(),
            theme: ThemeData(
              primaryColor: const Color(0xFF554AD4),
              hintColor: Color(0xFF6D6D6D),
              colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.white),
              textTheme: GoogleFonts.interTextTheme(
                TextTheme(
                  labelLarge: TextStyle(color: Colors.black, fontSize: 18.sp),
                  labelMedium: TextStyle(fontSize: 11.sp, color: Colors.black),
                  labelSmall: TextStyle(fontSize: 9.sp, color: Colors.black),
                  displayLarge: TextStyle(color: Colors.white, fontSize: 18.sp),
                  displayMedium: TextStyle(fontSize: 11.sp, color: Colors.white),
                  displaySmall: TextStyle(fontSize: 9.sp, color: Colors.white),
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    ),
  );
}
