import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controllers/auth_controller.dart';
import 'package:pharmacy_app/controllers/home_controller.dart';
import 'package:pharmacy_app/models/category_model.dart';
import 'package:pharmacy_app/models/item_model.dart';
import 'package:pharmacy_app/widgets/custom_navbar.dart';
import 'package:pharmacy_app/widgets/hero_widget.dart';
import 'package:pharmacy_app/widgets/medicine_search_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authController = Get.put(AuthController());
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: 10.0,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10.0,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                          radius: 25.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Mr Mohamed"),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      child: IconButton(
                        onPressed: () {
                          _authController.signOut();
                        },
                        icon: Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1),
                MedicineSearchWidget(),
                SizedBox(height: 10.0),
                HeroWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xff59a381),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: Obx(() {
                    final isLoading = _homeController.isLoading;
                    return Skeletonizer(
                      enabled: isLoading,
                      effect: ShimmerEffect(
                        duration: const Duration(milliseconds: 1100),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _homeController.categories.length,
                        itemBuilder: (context, index) {
                          final category = _homeController.categories[index];
                          return _buildCategory(category);
                        },
                      ),
                    );
                  }),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bestseller Products",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xff59a381),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Obx(() {
                  final isLoading = _homeController.isLoading;
                  return Skeletonizer(
                    enabled: isLoading,
                    effect: ShimmerEffect(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: _homeController.bestSellerProduct.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final item = _homeController.bestSellerProduct[index];
                        return _buildItemCard(item);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(controller: _homeController),
    );
  }

  Widget _buildCategory(CategoryModel category) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10, left: 5),
          width: 65,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.green.shade300,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: category.imagePath.isNotEmpty
                ? Image.network(category.imagePath, height: 50)
                : Icon(Icons.image_not_supported),
          ),
        ),
        SizedBox(height: 10.0),
        Text(category.name, style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildItemCard(ItemModel item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.network(item.imagePath, fit: BoxFit.contain),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              spacing: 8.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(item.category),
                Row(
                  children: [
                    Text(
                      item.price.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
