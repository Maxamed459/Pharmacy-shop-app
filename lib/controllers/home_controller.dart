import 'package:get/get.dart';
import 'package:pharmacy_app/models/category_model.dart';
import 'package:pharmacy_app/models/item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final supabase = Supabase.instance.client;
  final _isloading = false.obs;
  bool get isloading => _isloading.value;
  final _isCategoriesLoading = false.obs;
  final _isProductsLoading = false.obs;
  bool get isLoading => _isCategoriesLoading.value || _isProductsLoading.value;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  RxList<ItemModel> bestSellerProduct = <ItemModel>[].obs;

  void updatedSelectedindex(int index) {
    currentIndex.value = index;
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      _isCategoriesLoading.value = true;
      final response = await supabase
          .from('categories')
          .select('category_id, name, image_path');

      final data = response.map((e) => CategoryModel.fromJson(e)).toList();
      // print('This is data $data');
      categories.value = data;

      return categories;
    } catch (e) {
      print('Error at this place: $e');
      return [];
    } finally {
      _isCategoriesLoading.value = false;
    }
  }

  Future<List<ItemModel>> fetchProducts() async {
    try {
      _isProductsLoading.value = true;
      final response = await supabase
          .from('products')
          .select(
            'product_id, name, image_url, description, price, category_id, categories(name) ',
          );
      final data = response.map((e) => ItemModel.fromJson(e)).toList();
      bestSellerProduct.value = data;
      return bestSellerProduct;
    } catch (e) {
      print('Error at this place: $e');
      return [];
    } finally {
      _isProductsLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Fetch categories when controller is initialized
    fetchProducts();
  }
}
