class PrizeListData {
  PrizeListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.prizeDescription,
    this.value = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  String prizeDescription;
  int value;

  static List<PrizeListData> tabIconsList = <PrizeListData>[
    PrizeListData(
      imagePath: 'assets/berry_app/ps5.png',
      titleTxt: 'PlayStation 5',
      value: 525,
      prizeDescription: 'Click For Details',
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    PrizeListData(
      imagePath: 'assets/berry_app/xbox.png',
      titleTxt: 'Xbox One',
      value: 602,
      prizeDescription: 'Click For Details',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    PrizeListData(
      imagePath: 'assets/berry_app/amazongiftcard.png',
      titleTxt: 'Amazon Gift Card',
      value: 0,
      prizeDescription: 'Click For Details',
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    PrizeListData(
      imagePath: 'assets/berry_app/amexgiftcard.png',
      titleTxt: 'Amex Gift Card',
      value: 0,
      prizeDescription: 'Click For Details',
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
