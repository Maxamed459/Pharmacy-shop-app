class ItemModel {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final String category;
  final double price;

  ItemModel({required this.id, required this.name, required this.imagePath, required this.description, required this.category, required this.price});
  
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(id: json['product_id'], name: json['name'], imagePath: json['image_url'], description: json['description'], category: json['categories']?['name'], price: json['price']);
  }
}