class SliderModel {
  final String? image;
  final String? url;

  SliderModel({this.image, this.url});

  static List<SliderModel> slider = [
    SliderModel(
        image:
            'https://punktid.ee/blog/wp-content/uploads/2021/09/kinkekaardid-blogipilt-ET39.jpg'),
    SliderModel(
        image:
            'https://i.pinimg.com/originals/86/cb/28/86cb28eb9d01628e1ebf187a9c53f11a.jpg'),
    SliderModel(
        image:
            'https://img.freepik.com/free-vector/realistic-black-friday-sale-with-3d-elements_1361-3698.jpg?size=626&ext=jpg&ga=GA1.1.386372595.1698278400&semt=ais'),
  ];

  // factory SliderModel.fromJson(Map<String, dynamic> json) {
  //   return SliderModel(
  //     title: json[ApiStrings.title],
  //     image: json[ApiStrings.image],
  //     url: json[ApiStrings.url],
  //   );
  // }
  //
  // static List<SliderModel> responseToSliderModel(dynamic response) {
  //   final data = response[ApiStrings.banners];
  //
  //   final sliders = List<SliderModel>.from(
  //     data.map(
  //       (model) => SliderModel.fromJson(model),
  //     ),
  //   );
  //
  //   return sliders;
  // }
}
