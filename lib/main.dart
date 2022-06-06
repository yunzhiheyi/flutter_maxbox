// ignore_for_file: unused_import,unnecessary_import, depend_on_referenced_packages, unnecessary_new, unnecessary_overrides, prefer_const_constructors
import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_box/bloc/global/bloc/global_bloc.dart';
import 'package:max_box/bloc/teleprompter/teleprompter_bloc.dart';
import 'package:max_box/bloc/user/user_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:max_box/common/AndroidWinodwApp.dart';
import 'package:flutter/services.dart';
import './router/Routes.dart';
import 'router/navigatorRouterObserver.dart';
import 'utils/adApt.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //滚动性能优化 1.22.0
  // GestureBinding.instance?.resamplingEnabled = true;
  Routes.configureRoutes();

  ///状态栏样式-沉浸式状态栏
  // //黑色沉浸式状态栏，基于SystemUiOverlayStyle.dark修改了statusBarColor
  SystemUiOverlayStyle uiOverlayStyle = const SystemUiOverlayStyle(
    systemNavigationBarDividerColor: null,
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
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
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = Adapt.px(42)
    ..radius = Adapt.px(8)
    ..fontSize = Adapt.px(28)
    ..lineWidth = 2
    ..progressColor = Colors.white
    ..backgroundColor = Colors.transparent
    ..boxShadow = <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(0.6), // 阴影的颜色
      ),
    ]
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Color.fromRGBO(0, 0, 0, 0.5)
    ..userInteractions = true
    ..contentPadding = EdgeInsets.all(Adapt.px(25))
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(),
          ),
          BlocProvider<TeleprompterBloc>(
            create: (BuildContext context) => TeleprompterBloc(),
          ),
          BlocProvider<GlobalBloc>(
            create: (BuildContext context) => GlobalBloc(),
          ),
        ],
        child: MaterialApp(
          navigatorObservers: [NavigatorRouterObserver()],
          // initialRoute: '/splash',
          initialRoute: '/home',
          // routes: AppRoutes.getRoutes(),
          localizationsDelegates: const [
            // 这行是关键
            // RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            S.delegate,
          ],
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
            //点击的背景高亮颜色,处理阴影
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          // darkTheme: ThemeData.dark(),
          // home: Layout(),
          onGenerateRoute: Routes.router.generator,
          locale: const Locale('zh_CN'),
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
    // debugPrint(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
