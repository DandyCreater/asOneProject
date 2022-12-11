class CarouselEntity {
  String? responseCode;
  OKContentCarouselEntity? oKContentCarousel;

  CarouselEntity({required this.responseCode, required this.oKContentCarousel});

  CarouselEntity.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentCarousel = json['OKContentCarousel'] != null
        ? new OKContentCarouselEntity.fromJson(json['OKContentCarousel'])
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
}

class OKContentCarouselEntity {
  List<CarouselList>? carousel;

  OKContentCarouselEntity({required this.carousel});

  OKContentCarouselEntity.fromJson(Map<String, dynamic> json) {
    if (json['carousel'] != null) {
      carousel = <CarouselList>[];
      json['carousel'].forEach((v) {
        carousel!.add(new CarouselList.fromJson(v));
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
}

class CarouselList {
  String? imageUrl;

  CarouselList({required this.imageUrl});

  CarouselList.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
