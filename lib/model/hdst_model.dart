class HdstModel {
  final int hdstId;
  final String hdstNm;
  final String repesntFileNm;
  final String hdstInduty;
  final String appnYear;
  final String opbizDe;
  final String bsnTime;
  final String cttPc;
  final String adres;
  final String hmPg;
  final String? ctprvnCd;
  final String? signguCd;
  final String dc;
  final String parkngPosblYn;
  final String resvePosblYn;
  final String cardPosblYn;
  final String packngPosblYn;
  final String dspsnCnvncYn;

  HdstModel({
    required this.hdstId,
    required this.hdstNm,
    required this.repesntFileNm,
    required this.hdstInduty,
    required this.appnYear,
    required this.opbizDe,
    required this.bsnTime,
    required this.cttPc,
    required this.adres,
    required this.hmPg,
    required this.ctprvnCd,
    required this.signguCd,
    required this.dc,
    required this.parkngPosblYn,
    required this.resvePosblYn,
    required this.cardPosblYn,
    required this.packngPosblYn,
    required this.dspsnCnvncYn,
  });

  factory HdstModel.from(Map<String, dynamic> json) => HdstModel(
    hdstId: json["hdstId"],
    hdstNm: json["hdstNm"],
    repesntFileNm: json["repesntFileNm"],
    hdstInduty: json["hdstInduty"],
    appnYear: json["appnYear"],
    opbizDe: json["opbizDe"],
    bsnTime: json["bsnTime"],
    cttPc: json["cttPc"],
    adres: json["adres"],
    hmPg: json["hmPg"],
    ctprvnCd: json["ctprvnCd"],
    signguCd: json["signguCd"],
    dc: json["dc"],
    parkngPosblYn: json["parkngPosblYn"],
    resvePosblYn: json["resvePosblYn"],
    cardPosblYn: json["cardPosblYn"],
    packngPosblYn: json["packngPosblYn"],
    dspsnCnvncYn: json["dspsnCnvncYn"],
  );
}

// hdstId": 3078,
// "hdstNm": "금호송어장",
// "repesntFileNm": "",
// "hdstInduty": "음식점업",
// "appnYear": "2021년",
// "opbizDe": "1985-08-10",
// "bsnTime": "-",
// "cttPc": "0439315050",
// "adres": "충청북도 청주시 서원구 현도면 노산하석로 166",
// "hmPg": "-",
// "ctprvnCd": null,
// "signguCd": null,
// "dc": "1999년 청주시 부모산 중턱에서 갈비집 창업을 시작으로 한우물 경영 중이며, 창업 이후 가격을 그대로 유지 중이다. 고기를 재우는데 웰빙 특제소스를 개발하여 사용하고, 직접 재배한 농산물을 사용하며 ‘친환경 먹거리’ 제공을 실천하다.",
// "parkngPosblYn": "N",
// "resvePosblYn": "N",
// "cardPosblYn": "N",
// "packngPosblYn": "N",
// "dspsnCnvncYn": "N"
