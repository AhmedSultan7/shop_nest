class ProductModel {
  final int id;
  final String image;
  final String title;
  final num price;

  ProductModel(
      {required this.price,
      required this.image,
      required this.title,
      required this.id});

  //! Local Constructor---------------------------------------
  factory ProductModel.fromLocal(Map<dynamic, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        image: json['image']);
  }

  Map toLocalJson() => {
        'id': id,
        'title': title,
        'image': image,
        'price': price,
      };

  static List<ProductModel> productList = [
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://quick4pay.com/wp-content/uploads/2018/05/google-play-600x600.png',
      title: 'جوجل بلاي 10 - للحسابات الأمريكية',
    ),
    ProductModel(
      id: 2,
      price: 250,
      image: 'https://livekaarten.be/pl/apple-gift-card-10-eur-be-67516.png',
      title: 'بطاقة ابل 250 ريال - للحساب السعودي',
    ),
    ProductModel(
      id: 3,
      price: 150,
      image:
          'https://production-gameflipusercontent.fingershock.com/us-east-1:b55a2dc3-706d-4e3d-80ad-cd56986dada5/06255277-cf0d-4413-95aa-35aac45a41b9/311e838d-7f6c-46c2-917b-11c0dc3336e7',
      title: 'بطاقة اكس بوكس',
    ),
    ProductModel(
      id: 4,
      price: 4.66,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZDRxtyB4eWZhC_jX9tJ14tjvUsHXBEsXO1hO_cZ8Ks1U0NCtiTxU2XTdIK3Zw9AVkpkM&usqp=CAU',
      title: 'بطاقة الألعاب',
    ),
    ProductModel(
      id: 5,
      price: 4.66,
      image:
          'https://jubaqa.com/cdn/shop/products/c9f99b70b4ce560d18d1056f36eb45aa_50777fe7-a446-40fb-92cb-944349cd869b.jpg?v=1640999499',
      title: 'بطاقات بلاي ستيشن ستور',
    ),
  ];
  static List<ProductModel> productListSub = [
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://egynewtech.com/image/cache/catalog/All%20Cards%20Images/PSN%20Cards/KSA/100-KSA-PlayStation-Store-Gift-Card-Digital-Code-1000x1000.jpg',
      title: 'بطاقات بلاي ستيشن سعودي',
    ),
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://egynewtech.com/image/cache/catalog/All%20Cards%20Images/PSN%20Cards/KSA/100-KSA-PlayStation-Store-Gift-Card-Digital-Code-1000x1000.jpg',
      title: 'بطاقات بلاي ستيشن سعودي',
    ),
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://egynewtech.com/image/cache/catalog/All%20Cards%20Images/PSN%20Cards/KSA/100-KSA-PlayStation-Store-Gift-Card-Digital-Code-1000x1000.jpg',
      title: 'بطاقات بلاي ستيشن سعودي',
    ),
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://egynewtech.com/image/cache/catalog/All%20Cards%20Images/PSN%20Cards/KSA/100-KSA-PlayStation-Store-Gift-Card-Digital-Code-1000x1000.jpg',
      title: 'بطاقات بلاي ستيشن سعودي',
    ),
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://egynewtech.com/image/cache/catalog/All%20Cards%20Images/PSN%20Cards/KSA/100-KSA-PlayStation-Store-Gift-Card-Digital-Code-1000x1000.jpg',
      title: 'بطاقات بلاي ستيشن سعودي',
    ),
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://egynewtech.com/image/cache/catalog/All%20Cards%20Images/PSN%20Cards/KSA/100-KSA-PlayStation-Store-Gift-Card-Digital-Code-1000x1000.jpg',
      title: 'بطاقات بلاي ستيشن سعودي',
    ),
    ProductModel(
      id: 1,
      price: 20,
      image:
          'https://egynewtech.com/image/cache/catalog/All%20Cards%20Images/PSN%20Cards/KSA/100-KSA-PlayStation-Store-Gift-Card-Digital-Code-1000x1000.jpg',
      title: 'بطاقات بلاي ستيشن سعودي',
    ),
  ];
}
