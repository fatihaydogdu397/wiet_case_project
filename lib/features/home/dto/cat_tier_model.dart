class CatTierModel {
  final String version;
  final bool isSuccess;
  final Result result;
  final String message;
  final int statusCode;

  CatTierModel({
    required this.version,
    required this.isSuccess,
    required this.result,
    required this.message,
    required this.statusCode,
  });

  factory CatTierModel.fromJson(Map<String, dynamic> json) {
    return CatTierModel(
      version: json['Version'],
      isSuccess: json['IsSuccess'],
      result: Result.fromJson(json['Result']),
      message: json['Message'],
      statusCode: json['StatusCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Version': version,
      'IsSuccess': isSuccess,
      'Result': result.toJson(),
      'Message': message,
      'StatusCode': statusCode,
    };
  }
}

class Result {
  final List<Cat> cats;
  final List<Tier> tiers;
  final String currentTier;
  final int tierPoints;

  Result({
    required this.cats,
    required this.tiers,
    required this.currentTier,
    required this.tierPoints,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      cats: (json['cats'] as List).map((cat) => Cat.fromJson(cat)).toList(),
      tiers: (json['tiers'] as List).map((tier) => Tier.fromJson(tier)).toList(),
      currentTier: json['currentTier'],
      tierPoints: json['tierPoints'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cats': cats.map((cat) => cat.toJson()).toList(),
      'tiers': tiers.map((tier) => tier.toJson()).toList(),
      'currentTier': currentTier,
      'tierPoints': tierPoints,
    };
  }
}

class Cat {
  final String id;
  final String url;
  final int width;
  final int height;

  Cat({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'width': width,
      'height': height,
    };
  }
}

class Tier {
  final String tierName;
  final int minPoint;
  final int maxPoint;
  final int seqNo;
  final String fontColor;
  final String bgColor;
  final dynamic widgets;

  Tier({
    required this.tierName,
    required this.minPoint,
    required this.maxPoint,
    required this.seqNo,
    required this.fontColor,
    required this.bgColor,
    this.widgets,
  });

  factory Tier.fromJson(Map<String, dynamic> json) {
    return Tier(
      tierName: json['tierName'],
      minPoint: json['minPoint'],
      maxPoint: json['maxPoint'],
      seqNo: json['seqNo'],
      fontColor: json['fontColor'],
      bgColor: json['bgColor'],
      widgets: json['widgets'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tierName': tierName,
      'minPoint': minPoint,
      'maxPoint': maxPoint,
      'seqNo': seqNo,
      'fontColor': fontColor,
      'bgColor': bgColor,
      'widgets': widgets,
    };
  }
}
