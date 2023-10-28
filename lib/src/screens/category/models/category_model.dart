class CategoryModel {
  final String image;
  final String title;

  CategoryModel({required this.image, required this.title});

  static List<CategoryModel> categoryList = [
    CategoryModel(
        image:
            'https://seagm-media.seagmcdn.com/item_og/playstation-network-card-code.jpg',
        title: 'بطاقات بلاي ستيشن'),
    CategoryModel(
        image:
            'https://www.taaqup.com/wp-content/uploads/2021/10/%D8%B4%D8%B9%D8%A7%D8%B1-%D9%85%D8%AA%D8%AC%D8%B1-Google-Play.webp',
        title: 'بطاقات جوجل بلاي'),
    CategoryModel(
        image:
            'https://eshop.umniah.com/media/wysiwyg/New_E-Shop_Visuals_-1-01.jpg',
        title: 'بطاقات الألعاب'),
    CategoryModel(
        image: 'https://livekaarten.be/pl/apple-gift-card-10-eur-be-67516.png',
        title: 'بطاقات آبل'),
  ];
}
