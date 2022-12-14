import 'package:as_one/app/theme/color.dart';
import 'package:as_one/app/theme/text.dart';
import 'package:as_one/presentation/bloc/dashboard/carousel/carousel_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/item-dashboard/item_dashboard_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/menu/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController(viewportFraction: .9);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Center(
                          child: SvgPicture.asset('assets/icons/location.svg')),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 20,
                      child: Center(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Lokasi Kamu ',
                              style: ThemeText()
                                  .inActiveNavBarText()
                                  .copyWith(fontSize: 14),
                            ),
                            TextSpan(
                              text: 'Kota Manado',
                              style: ThemeText()
                                  .regularText()
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const SizedBox(
                        height: 20,
                        child: Center(
                          child: Icon(
                            Icons.expand_more,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.3,
              child: BlocBuilder<CarouselBloc, CarouselState>(
                builder: (context, state) {
                  if (state is CarouselSuccess) {
                    var items = state.value!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                            itemCount: items.length,
                            itemBuilder: ((context, itemIndex, pageViewIndex) {
                              return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.shade200,
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(items[itemIndex]
                                              .imageUrl
                                              .toString()),
                                          fit: BoxFit.cover)));
                            }),
                            options: CarouselOptions(
                                enableInfiniteScroll: false,
                                aspectRatio: 2.15,
                                viewportFraction:
                                    pageController.viewportFraction,
                                enlargeCenterPage: false,
                                pauseAutoPlayOnManualNavigate: true,
                                autoPlay: false,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                })),
                        const SizedBox(height: 20.0),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.06,
                          ),
                          child: AnimatedSmoothIndicator(
                            activeIndex: _currentIndex,
                            count: items.length,
                            effect: const SlideEffect(
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              dotColor: Colors.grey,
                              activeDotColor: ColorManager.blackColor,
                              radius: 20.0,
                              spacing: 5,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.16,
              child: BlocBuilder<MenuBloc, MenuState>(
                builder: (context, state) {
                  if (state is MenuSuccess) {
                    var items = state.value;
                    return ListView.builder(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: items!.length,
                        itemBuilder: ((context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: ColorManager.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                                color: ColorManager.blackColor
                                                    .withOpacity(0.1),
                                                offset: const Offset(0, 1),
                                                spreadRadius: 0,
                                                blurRadius: 3),
                                          ]),
                                      child:
                                          Image.asset(items[index].imageUrl!),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      items[index].menuName!,
                                      style: ThemeText().regularText(),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          );
                        }));
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Pilihan untuk kamu",
                        style: ThemeText().regularText().copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        "Lihat Semua",
                        style: ThemeText().activeNavBarText().copyWith(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.43,
              child: BlocBuilder<ItemDashboardBloc, ItemDashboardState>(
                builder: (context, state) {
                  if (state is ItemDashboardSuccess) {
                    var items = state.value;
                    return ListView.builder(
                        padding: const EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: items!.length,
                        itemBuilder: (context, index) {
                          var intActualPrice =
                              int.tryParse(items[index].actualPrice!);
                          var intDisconPrice =
                              int.tryParse(items[index].disconPrice!);

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.37,
                                  width: width * 0.35,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 2),
                                        blurRadius: 10,
                                        spreadRadius: 0)
                                  ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * 0.17,
                                        width: width * 0.35,
                                        decoration: BoxDecoration(
                                            color: ColorManager.whiteColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    items[index].imageUrl!),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        height: height * 0.2,
                                        width: width * 0.35,
                                        decoration: const BoxDecoration(
                                            color: ColorManager.whiteColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                items[index].itemsName!,
                                                style: ThemeText()
                                                    .regularText()
                                                    .copyWith(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: NumberFormat.currency(
                                                            symbol: "Rp.",
                                                            decimalDigits: 0)
                                                        .format(intActualPrice),
                                                    style: ThemeText()
                                                        .inActiveNavBarText()
                                                        .copyWith(
                                                            fontSize: 8,
                                                            color: ColorManager
                                                                .lineTextColor,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' ${NumberFormat.currency(symbol: "Rp.", decimalDigits: 0).format(intDisconPrice)}',
                                                    style: ThemeText()
                                                        .inActiveNavBarText()
                                                        .copyWith(
                                                            color: ColorManager
                                                                .blackColor,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                ]),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                items[index].productType!,
                                                style:
                                                    ThemeText().regularText(),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: width,
                                                    height: 8,
                                                    decoration: BoxDecoration(
                                                        color: ColorManager
                                                            .backgroundProgress,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                                  Container(
                                                    width: width * 0.2,
                                                    height: 8,
                                                    decoration: BoxDecoration(
                                                        color: ColorManager
                                                            .mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text:
                                                        items[index].terkumpul,
                                                    style: ThemeText()
                                                        .inActiveNavBarText()
                                                        .copyWith(
                                                            fontSize: 12,
                                                            color: ColorManager
                                                                .mainColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' dari ${items[index].totalOrang} orang',
                                                    style: ThemeText()
                                                        .inActiveNavBarText()
                                                        .copyWith(
                                                            color: ColorManager
                                                                .blackColor,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          );
                        });
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
