import 'package:as_one/app/theme/color.dart';
import 'package:as_one/app/theme/text.dart';
import 'package:as_one/presentation/screen/buka/buka_page.dart';
import 'package:as_one/presentation/screen/eksplor/eksplor_page.dart';
import 'package:as_one/presentation/screen/homepage/homepage.dart';
import 'package:as_one/presentation/screen/pesanan/pesanan_page.dart';
import 'package:as_one/presentation/screen/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  var pages = [
    const HomePage(),
    const EksplorPage(),
    const BukaPage(),
    const PesananPage(),
    const ProfilePage(),
  ];

  void _onTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.whiteColor,
      body: pages[currentPage],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: height * 0.1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => _onTapped(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (currentPage == 0)
                          ? SvgPicture.asset(
                              "assets/icons/home_active.svg",
                              height: 18,
                              width: 18,
                            )
                          : SvgPicture.asset(
                              "assets/icons/home_inactive.svg",
                              height: 18,
                              width: 18,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Utama",
                        style: ThemeText().activeNavBarText().copyWith(
                            color: (currentPage == 0)
                                ? ColorManager.mainColor
                                : ColorManager.inActiveColor),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => _onTapped(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (currentPage == 1)
                          ? SvgPicture.asset(
                              "assets/icons/eksplor_active.svg",
                              height: 18,
                              width: 18,
                            )
                          : SvgPicture.asset(
                              "assets/icons/eksplor_inactive.svg",
                              height: 18,
                              width: 18,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Eksplor",
                        style: ThemeText().activeNavBarText().copyWith(
                            color: (currentPage == 1)
                                ? ColorManager.mainColor
                                : ColorManager.inActiveColor), // regularStyle(
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Buka",
                      style: ThemeText().inActiveNavBarText(),
                    )
                  ],
                ),
                InkWell(
                  onTap: () => _onTapped(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (currentPage == 2)
                          ? SvgPicture.asset(
                              "assets/icons/pesanan_inactive.svg",
                              height: 18,
                              width: 18,
                            )
                          : SvgPicture.asset(
                              "assets/icons/pesanan_inactive.svg",
                              height: 18,
                              width: 18,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Pesanan",
                          style: ThemeText().activeNavBarText().copyWith(
                              color: (currentPage == 2)
                                  ? ColorManager.mainColor
                                  : ColorManager.inActiveColor)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => _onTapped(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (currentPage == 4)
                          ? SvgPicture.asset(
                              "assets/icons/profile_inactive.svg",
                              height: 18,
                              width: 18,
                            )
                          : SvgPicture.asset(
                              "assets/icons/profile_inactive.svg",
                              height: 18,
                              width: 18,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Saya",
                          style: ThemeText().activeNavBarText().copyWith(
                              color: (currentPage == 4)
                                  ? ColorManager.mainColor
                                  : ColorManager.inActiveColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: ColorManager.mainColor,
          onPressed: () => _onTapped(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/buka.svg",
                height: 30,
                width: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
