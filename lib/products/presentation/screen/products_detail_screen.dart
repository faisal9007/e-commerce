import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../features/shared/presentation/widget/cart_item.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentImageIndex = 0;
  int _quantity = 1;
  int _selectedColorIndex = 1;
  int _selectedSizeIndex = 1;
  bool _isWishlisted = false;

  final List<Color> _colors = [
    Colors.black,
    const Color(0xFF07ADAE),
    const Color(0xFF8B5E3C),
    const Color(0xFFD6D6D6),
    const Color(0xFF757575),
  ];

  final List<String> _colorNames = [
    'Black',
    'Teal',
    'Brown',
    'Silver',
    'Gray',
  ];

  final List<String> _sizes = ['X', 'XL', '2L', 'X'];

  final List<String> _images = [
    AssetsPath.dummyShoePng,
    AssetsPath.dummyShoePng,
    AssetsPath.dummyShoePng,
    AssetsPath.dummyShoePng,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildTitleAndQuantity(),
                        const SizedBox(height: 8),
                        _buildRatingRow(),
                        const SizedBox(height: 20),
                        _buildColorSelector(),
                        const SizedBox(height: 20),
                        _buildSizeSelector(),
                        const SizedBox(height: 20),
                        _buildDescription(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // AppBar
  // ─────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Product Details',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // Image Carousel
  // ─────────────────────────────────────────
  Widget _buildImageCarousel() {
    return Container(
      color: AppColors.themeColor.withOpacity(0.08),
      child: Column(
        children: [
          SizedBox(
            height: 280,
            child: PageView.builder(
              itemCount: _images.length,
              onPageChanged: (i) => setState(() => _currentImageIndex = i),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.image_not_supported_outlined,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          _buildDotIndicators(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_images.length, (i) {
        final bool isActive = i == _currentImageIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 12 : 10,
          height: isActive ? 12 : 10,
          decoration: BoxDecoration(
            color: isActive ? AppColors.themeColor : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.themeColor : Colors.grey.shade400,
            ),
          ),
        );
      }),
    );
  }

  // ─────────────────────────────────────────
  // Title + Quantity
  // ─────────────────────────────────────────
  Widget _buildTitleAndQuantity() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Text(
            'Happy New Year Special Deal\nSave 30%',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(width: 12),
        _buildQuantityControl(),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      children: [
        _quantityButton(
          icon: Icons.remove,
          onTap: () {
            if (_quantity > 1) setState(() => _quantity--);
          },
        ),
        Container(
          width: 36,
          alignment: Alignment.center,
          child: Text(
            _quantity.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _quantityButton(
          icon: Icons.add,
          onTap: () => setState(() => _quantity++),
          filled: true,
        ),
      ],
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
    bool filled = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: filled ? AppColors.themeColor : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: filled ? AppColors.themeColor : Colors.grey.shade300,
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: filled ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // Rating Row
  // ─────────────────────────────────────────
  Widget _buildRatingRow() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        const Text(
          '4.8',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Reviews',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.themeColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => setState(() => _isWishlisted = !_isWishlisted),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _isWishlisted
                  ? AppColors.themeColor
                  : AppColors.themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: _isWishlisted ? Colors.white : AppColors.themeColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // Color Selector
  // ─────────────────────────────────────────
  Widget _buildColorSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(_colors.length, (i) {
            final bool isSelected = i == _selectedColorIndex;
            return GestureDetector(
              onTap: () => setState(() => _selectedColorIndex = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 10),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _colors[i],
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: AppColors.themeColor, width: 2.5)
                      : Border.all(color: Colors.transparent),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 18)
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // Size Selector
  // ─────────────────────────────────────────
  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(_sizes.length, (i) {
            final bool isSelected = i == _selectedSizeIndex;
            return GestureDetector(
              onTap: () => setState(() => _selectedSizeIndex = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 10),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.themeColor : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.themeColor
                        : Colors.grey.shade400,
                  ),
                ),
                child: Center(
                  child: Text(
                    _sizes[i],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // Description
  // ─────────────────────────────────────────
  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Reference site about Lorem Ipsum, giving information on its origins, '
              'as well as a random Lipsum generator Reference site about Lorem Ipsum, '
              'giving information on its origins, as well as a random Lipsum generator',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // Bottom Bar — Add To Cart
  // ─────────────────────────────────────────
  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.12),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$1,000',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // ✅ Pass selected size and color to CartItem
                  context.read<CartProvider>().addToCart(
                    CartItem(
                      name: 'Happy New Year Special Deal',
                      price: 1000,
                      quantity: _quantity,
                      size: _sizes[_selectedSizeIndex],
                      color: _colorNames[_selectedColorIndex],
                      image: AssetsPath.dummyShoePng,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '✅ Added to cart — Size: ${_sizes[_selectedSizeIndex]}, Color: ${_colorNames[_selectedColorIndex]}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.themeColor,
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}