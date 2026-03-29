import 'package:get/get.dart';
import 'package:pharmacy_app/models/category_model.dart';
import 'package:pharmacy_app/models/item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {

  final RxInt currentIndex = 0.obs;
  final supabase = Supabase.instance.client;
  final _isloading = false.obs;
  get isloading => _isloading.value;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  final RxList<ItemModel> bestSellerProduct = <ItemModel>[
    ItemModel(id: '1', name: 'Liver cleans Detox', imagePath: 'assets/images/pill.png', description: 'Health Voda Liver cleans Detox & repair natural', category: 'Pills', price: 29.99),
    ItemModel(id: '2', name: 'Sun Cream', imagePath: 'assets/images/creams.png', description: 'High quality Sun Cream natural 100%', category: 'Creams', price: 19.55),
    ItemModel(id: '3', name: 'Vitamin capsules', imagePath: 'assets/images/vitamins.png', description: 'Health Vitamins for elder and middle age people for boosting immune system', category: 'Vitamins', price: 39.00),
    ItemModel(id: '5', name: 'High Protein pills', imagePath: 'assets/images/supplements.png', description: 'High Protein supplements boosts energy and grows muscle', category: 'Supplements', price: 99.99),
  ].obs;

  void updatedSelectedindex(int index) {
    currentIndex.value = index;
  }

  Future<List<CategoryModel>> fetchCategories() async {

    try {
      _isloading.value = true;
      final response = await supabase.from('categories').select('category_id, name, image_path');

      final data = response.map((e) => CategoryModel.fromJson(e)).toList();
      // print('This is data $data');
      categories.value = data;
      return categories;

    } catch (e) {
      print('Error at this place: $e');
      return [];
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Fetch categories when controller is initialized
  }

}

