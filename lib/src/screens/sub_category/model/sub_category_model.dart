class SubCategoryModel {
  final String image;
  final String title;

  SubCategoryModel({
    required this.image,
    required this.title,
  });

  static List<SubCategoryModel> subCategoryList = [
    SubCategoryModel(
        image:
            'https://seagm-media.seagmcdn.com/item_og/playstation-network-card-code.jpg',
        title: 'بطاقات بلاي ستيشن سعودي'),
    SubCategoryModel(
        image:
            'https://seagm-media.seagmcdn.com/item_og/playstation-network-card-code.jpg',
        title: 'بطاقات بلاي ستيشن كويتي'),
    SubCategoryModel(
        image:
            'https://seagm-media.seagmcdn.com/item_og/playstation-network-card-code.jpg',
        title: 'بطاقات بلاي ستيشن إماراتي'),
    SubCategoryModel(
        image:
            'https://seagm-media.seagmcdn.com/item_og/playstation-network-card-code.jpg',
        title: 'بطاقات بلاي ستيشن لبناني'),
    SubCategoryModel(
        image:
            'https://seagm-media.seagmcdn.com/item_og/playstation-network-card-code.jpg',
        title: 'بطاقات بلاي ستيشن عمان'),
  ];
}
