import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_box/bloc/home/home_content_bloc.dart';
import 'package:max_box/bloc/user/user_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:max_box/common/AndroidWinodwApp.dart';
import 'package:flutter/services.dart';
import './router/Routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //滚动性能优化 1.22.0
  // GestureBinding.instance?.resamplingEnabled = true;
  Routes.configureRoutes();

  ///状态栏样式-沉浸式状态栏
  //黑色沉浸式状态栏，基于SystemUiOverlayStyle.dark修改了statusBarColor
  SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarDividerColor: null,
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);

  BlocOverrides.runZoned(
    () => runApp(new MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
  configLoading();
}

@pragma('vm:entry-point')
void androidWindow() {
  BlocOverrides.runZoned(
    () => runApp(const AndroidWindowApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

// 配置Loading
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 30.0
    ..radius = 8.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    // ..contentPadding = EdgeInsets.symmetric(
    //   vertical: 15.0,
    //   horizontal: 25.0,
    // )
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(),
          ),
          BlocProvider<HomeContentBloc>(
            create: (BuildContext context) => HomeContentBloc(),
          ),
        ],
        child: MaterialApp(
          initialRoute: '/home',
          // routes: AppRoutes.getRoutes(),
          localizationsDelegates: [
            // 这行是关键
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            S.delegate,
          ],
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
          ),
          // darkTheme: ThemeData.dark(),
          // home: Layout(),
          onGenerateRoute: Routes.router.generator,
          locale: const Locale('zh'),
          // localeResolutionCallback:
          //     (Locale locale, Iterable<Locale> supportedLocales) {
          //   return locale;
          // },
          supportedLocales: S.delegate.supportedLocales,
          builder: EasyLoading.init(),
        ));
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
