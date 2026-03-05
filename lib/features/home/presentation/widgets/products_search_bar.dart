import 'package:flutter/material.dart';

class ProductsSearchBar extends StatelessWidget {
  const ProductsSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        textInputAction: .search,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            enabledBorder: _border,
            focusedBorder: _border,
            border: _border,
        )
    );
  }
  OutlineInputBorder get _border {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none
    );
  }
}