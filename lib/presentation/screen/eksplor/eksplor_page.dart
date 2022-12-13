// ignore_for_file: sort_child_properties_last

import 'package:as_one/app/theme/color.dart';
import 'package:as_one/app/theme/text.dart';
import 'package:as_one/presentation/bloc/explore/bloc/item_explore_bloc.dart';
import 'package:as_one/presentation/screen/detail/order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EksplorPage extends StatefulWidget {
  const EksplorPage({super.key});

  @override
  State<EksplorPage> createState() => _EksplorPageState();
}

class _EksplorPageState extends State<EksplorPage> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.whiteColor,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(
                      Icons.search,
                      color: ColorManager.blackColor,
                      size: 30,
                    ),
                  ),
                  hintText: "Cari barang atau Toko",
                  hintStyle: GoogleFonts.poppins(
                      color: ColorManager.lineTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                  contentPadding: const EdgeInsets.fromLTRB(0, 12, 4, 10),
                  isDense: true,
                  isCollapsed: true,
                  fillColor: ColorManager.filledTextField,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
          ),
          toolbarHeight: 70,
          bottom: PreferredSize(
              child: SizedBox(
                height: 30,
                child: ListView(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: ColorManager.blackColor, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset("assets/icons/filter.svg"),
                                Text(
                                  "Filter",
                                  style: ThemeText()
                                      .regularText()
                                      .copyWith(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (index == 0)
                                    ? ColorManager.mainColor
                                    : ColorManager.inactiveChip),
                            child: Center(
                                child: Text(
                              "All",
                              style: (index == 0)
                                  ? ThemeText()
                                      .regularText()
                                      .copyWith(color: ColorManager.whiteColor)
                                  : ThemeText().regularText(),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (index == 1)
                                    ? ColorManager.mainColor
                                    : ColorManager.inactiveChip),
                            child: Center(
                                child: Text(
                              "Reguler",
                              style: (index == 1)
                                  ? ThemeText()
                                      .regularText()
                                      .copyWith(color: ColorManager.whiteColor)
                                  : ThemeText().regularText(),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (index == 2)
                                    ? ColorManager.mainColor
                                    : ColorManager.inactiveChip),
                            child: Center(
                                child: Text(
                              "Kargo",
                              style: (index == 2)
                                  ? ThemeText()
                                      .regularText()
                                      .copyWith(color: ColorManager.whiteColor)
                                  : ThemeText().regularText(),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 3;
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (index == 3)
                                    ? ColorManager.mainColor
                                    : ColorManager.inactiveChip),
                            child: Center(
                                child: Text(
                              "Grosir",
                              style: (index == 3)
                                  ? ThemeText()
                                      .regularText()
                                      .copyWith(color: ColorManager.whiteColor)
                                  : ThemeText().regularText(),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(50)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: BlocBuilder<ItemExploreBloc, ItemExploreState>(
            builder: (context, state) {
              if (state is ItemExploreSuccess) {
                var items = state.value;
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items!.length,
                    itemBuilder: ((context, index) {
                      var intActualPrice =
                          int.tryParse(items[index].actualPrice!);
                      var intDisconPrice =
                          int.tryParse(items[index].disconPrice!);
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => OrderDetailPage(
                                          imageUrl: items[index].imageUrl,
                                          productTitle: items[index].itemsName,
                                          price: intActualPrice,
                                          terkumpul: items[index].terkumpul!,
                                          totalOrang:
                                              items[index].totalOrang))));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: height * 0.18,
                              width: width,
                              decoration: BoxDecoration(
                                  color: ColorManager.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorManager.blackColor
                                          .withOpacity(0.2),
                                      offset: const Offset(0, 2),
                                      blurRadius: 2,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  items[index].imageUrl!),
                                              fit: BoxFit.cover)),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: width * 0.5,
                                          height: height * 0.04,
                                          child: Text(
                                            items[index].itemsName!,
                                            style: ThemeText()
                                                .regularText()
                                                .copyWith(fontSize: 12),
                                          ),
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
                                                      fontSize: 12,
                                                      color: ColorManager
                                                          .lineTextColor,
                                                      decoration: TextDecoration
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
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ]),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              width: width * 0.5,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: ColorManager
                                                      .backgroundProgress,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            Container(
                                              width: width * 0.3,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: ColorManager.mainColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "Terkumpul ",
                                                style: ThemeText()
                                                    .regularText()
                                                    .copyWith(
                                                        color: ColorManager
                                                            .inActiveColor,
                                                        fontSize: 12)),
                                            TextSpan(
                                              text: items[index].terkumpul,
                                              style: ThemeText()
                                                  .inActiveNavBarText()
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color: ColorManager
                                                          .mainColor,
                                                      fontWeight:
                                                          FontWeight.w700),
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
                                                          FontWeight.w700),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    }));
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
