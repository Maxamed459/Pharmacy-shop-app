import 'package:get/get.dart';
import 'package:pharmacy_app/models/category_model.dart';
import 'package:pharmacy_app/models/item_model.dart';

class HomeController extends GetxController {

  final RxInt currentIndex = 0.obs;

  final RxList<CategoryModel> categories = <CategoryModel>[
    CategoryModel(id: '1', name: 'supplement', imagePath: 'assets/images/supplements.png'),
    CategoryModel(id: '2', name: 'Pills', imagePath: 'assets/images/pill.png'),
    CategoryModel(id: '3', name: 'Vitamins', imagePath: 'assets/images/vitamins.png'),
    CategoryModel(id: '4', name: 'Syrups', imagePath: 'assets/images/liver.png'),
    CategoryModel(id: '5', name: 'Creams', imagePath: 'assets/images/creams.png'),
  ].obs;

  final RxList<ItemModel> bestSellerProduct = <ItemModel>[
    ItemModel(id: '1', name: 'Liver cleans Detox', imagePath: 'assets/images/pill.png', description: 'Health Voda Liver cleans Detox & repair natural', category: 'Pills', price: 29.99),
    ItemModel(id: '2', name: 'Sun Cream', imagePath: 'assets/images/creams.png', description: 'High quality Sun Cream natural 100%', category: 'Creams', price: 19.55),
    ItemModel(id: '3', name: 'Vitamin capsules', imagePath: 'assets/images/vitamins.png', description: 'Health Vitamins for elder and middle age people for boosting immune system', category: 'Vitamins', price: 39.00),
    ItemModel(id: '5', name: 'High Protein pills', imagePath: 'assets/images/supplements.png', description: 'High Protein supplements boosts energy and grows muscle', category: 'Supplements', price: 99.99),
  ].obs;

  void updatedSelectedindex(int index) {
    currentIndex.value = index;
  }

}

