import 'package:as_one/app/routes/routes.dart';
import 'package:as_one/presentation/bloc/dashboard/carousel/carousel_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/item-dashboard/item_dashboard_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/item-order-detail/item_order_detail_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/menu/menu_bloc.dart';
import 'package:as_one/presentation/bloc/explore/bloc/item_explore_bloc.dart';
import 'package:as_one/presentation/screen/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final carouselBloc = sl<CarouselBloc>();
    final menuBloc = sl<MenuBloc>();
    final itemDashboardBloc = sl<ItemDashboardBloc>();
    final itemExploreBloc = sl<ItemExploreBloc>();
    final itemOrderDetailBloc = sl<ItemOrderDetailBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => carouselBloc..add(FetchCarousel())),
        BlocProvider(create: (_) => menuBloc..add(FetchMenu())),
        BlocProvider(
            create: (_) => itemDashboardBloc..add(FetchItemDashboard())),
        BlocProvider(create: (_) => itemExploreBloc..add(FetchItemExplore())),
        BlocProvider(
            create: (_) => itemOrderDetailBloc..add(FetchItemOrderDetail()))
      ],
      child: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        ),
      ),
    );
  }
}
