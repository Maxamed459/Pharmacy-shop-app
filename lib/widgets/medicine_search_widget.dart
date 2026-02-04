import 'package:flutter/material.dart';

class MedicineSearchWidget extends StatelessWidget {
  const MedicineSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.0,
      children: [
        IconButton.outlined(onPressed: (){}, icon: Icon(Icons.qr_code_scanner_outlined),),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                hintText: 'Search medicine',
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                suffixIcon: Icon(Icons.camera_alt_outlined)
            ),
          ),
        ),
        IconButton.outlined(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined),),
      ],
    );
  }
}
