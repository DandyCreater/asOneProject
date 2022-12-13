import 'package:as_one/app/theme/color.dart';
import 'package:as_one/app/theme/text.dart';
import 'package:as_one/presentation/bloc/dashboard/item-dashboard/item_dashboard_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/item-order-detail/item_order_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {
  final String? imageUrl;
  final String? productTitle;
  final int? price;
  final String terkumpul;
  final String? totalOrang;
  const OrderDetailPage(
      {required this.imageUrl,
      required this.productTitle,
      required this.price,
      required this.terkumpul,
      required this.totalOrang,
      super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List anggota = [
      "assets/images/anggota_1.png",
      "assets/images/anggota_2.png",
      "assets/images/anggota_3.png",
      "assets/images/anggota_4.png",
      "assets/images/anggota_5.png",
    ];
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.35,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageUrl!), fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle!,
                    style: ThemeText().regularText(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    NumberFormat.currency(symbol: "Rp.", decimalDigits: 0)
                        .format(price!),
                    style: ThemeText().regularText().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.mainColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: width,
                        height: 15,
                        decoration: BoxDecoration(
                            color: ColorManager.backgroundProgress,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        width: width * 0.5,
                        height: 15,
                        decoration: BoxDecoration(
                            color: ColorManager.mainColor,
                            borderRadius: BorderRadius.circular(20)),
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
                          style: ThemeText().regularText().copyWith(
                              color: ColorManager.inActiveColor, fontSize: 14)),
                      TextSpan(
                        text: terkumpul,
                        style: ThemeText().inActiveNavBarText().copyWith(
                            fontSize: 14,
                            color: ColorManager.mainColor,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: ' dari ${totalOrang} orang',
                        style: ThemeText().inActiveNavBarText().copyWith(
                            color: ColorManager.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          height: 20,
                          child: Center(
                              child:
                                  Image.asset('assets/images/tokopedia.png'))),
                      const SizedBox(
                        width: 7,
                      ),
                      SizedBox(
                        height: 20,
                        child: Center(
                          child: Text(
                            "Cek link produk",
                            style: ThemeText()
                                .regularText()
                                .copyWith(color: ColorManager.storeColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const SizedBox(
                        height: 20,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.storeColor,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Deskripsi",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff5A5A5A), fontSize: 12),
                            ),
                            TextSpan(
                              text: ' ...Read more',
                              style: GoogleFonts.poppins(
                                  color: ColorManager.mainColor,
                                  fontWeight: FontWeight.w700),
                              // recognizer: TapGestureRecognizer()
                              // ..onTap = (){},
                            ),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Nama Toko",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              height: 20,
                              child: Center(
                                  child: Image.asset(
                                      'assets/images/tokopedia.png'))),
                          const SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 20,
                            child: Center(
                              child: Text(
                                "DBL Store",
                                style: ThemeText()
                                    .regularText()
                                    .copyWith(color: ColorManager.storeColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const SizedBox(
                            height: 20,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: ColorManager.storeColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Anggota bergabung",
                    style: ThemeText()
                        .regularText()
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      for (var i = 0; i < anggota.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(anggota[i]),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Kategori",
                    style: ThemeText()
                        .regularText()
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorManager.chipColor),
                        child: Center(
                          child: Text(
                            "Olahraga",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.textChipColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorManager.chipColor),
                        child: Center(
                          child: Text(
                            "Fashion",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.textChipColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Lokasi",
                    style: ThemeText()
                        .regularText()
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorManager.chipColor),
                        child: Center(
                          child: Text(
                            "Manado",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.textChipColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorManager.chipColor),
                        child: Center(
                          child: Text(
                            "Sulawesi Utara",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.textChipColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Orderan Serupa",
                        style: ThemeText().regularText().copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Lihat Semua",
                        style: ThemeText().regularText().copyWith(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.43,
              child: BlocBuilder<ItemOrderDetailBloc, ItemOrderDetailState>(
                builder: (context, state) {
                  if (state is ItemOrderDetailSuccess) {
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
                                  height: height * 0.4,
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
                                        height: height * 0.2,
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.32,
                    height: 45,
                    decoration: BoxDecoration(
                        color: ColorManager.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.mainColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.share,
                            color: ColorManager.mainColor,
                          ),
                          Text(
                            "Bagikan",
                            style: ThemeText().regularText().copyWith(
                                fontWeight: FontWeight.w700,
                                color: ColorManager.mainColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: width * 0.55,
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorManager.mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Gabung orderan",
                          style: ThemeText().regularText().copyWith(
                              color: ColorManager.whiteColor,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
