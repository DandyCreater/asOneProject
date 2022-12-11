import 'package:as_one/domain/entity/dashboard/carousel/carousel_entity.dart';

class CarouselResponseModel {
  String? responseCode;
  OKContentCarousel? oKContentCarousel;

  CarouselResponseModel({this.responseCode, this.oKContentCarousel});

  CarouselResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentCarousel = json['OKContentCarousel'] != null
        ? new OKContentCarousel.fromJson(json['OKContentCarousel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.oKContentCarousel != null) {
      data['OKContentCarousel'] = this.oKContentCarousel!.toJson();
    }
    return data;
  }

  CarouselEntity toEntity() {
    return CarouselEntity(
        responseCode: this.responseCode,
        oKContentCarousel: this.oKContentCarousel != null
            ? this.oKContentCarousel!.toEntity()
            : null);
  }
}

class OKContentCarousel {
  List<Carousel>? carousel;

  OKContentCarousel({this.carousel});

  OKContentCarousel.fromJson(Map<String, dynamic> json) {
    if (json['carousel'] != null) {
      carousel = <Carousel>[];
      json['carousel'].forEach((v) {
        carousel!.add(new Carousel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carousel != null) {
      data['carousel'] = this.carousel!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OKContentCarouselEntity toEntity() {
    return OKContentCarouselEntity(
        carousel: this.carousel != null
            ? this.carousel!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Carousel {
  String? imageUrl;

  Carousel({this.imageUrl});

  Carousel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  CarouselList toEntity() {
    return CarouselList(imageUrl: this.imageUrl);
  }
}
