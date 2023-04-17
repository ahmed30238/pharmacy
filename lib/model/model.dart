class PharmacyItemsModel {
  final String image;
  final String description;
  String? price;

  PharmacyItemsModel(
    this.image,
    this.description, {
    this.price,
  });
}
