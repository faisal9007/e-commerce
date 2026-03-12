import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widget/cart_item.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, _) {
          if (cart.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return _CartItemCard(item: item);
                  },
                ),
              ),
              _buildTotalBar(context, cart),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTotalBar(BuildContext context, CartProvider cart) {
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
              const Text('Total', style: TextStyle(color: Colors.black54)),
              Text(
                '\$${cart.totalPrice.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          const SizedBox(width: 50),
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Checkout',
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

// ─────────────────────────────────────────
// Cart Item Card
// ─────────────────────────────────────────
class _CartItemCard extends StatelessWidget {
  final CartItem item;
  const _CartItemCard({required this.item});

  void _showDeleteDialog(BuildContext context) {
    final cart = context.read<CartProvider>();
    final uniqueKey = item.uniqueKey;

    showDialog(
      context: context,
      // ✅ Use root navigator so dialog pops correctly
      // even inside a nested tab Navigator
      useRootNavigator: true,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Remove Item',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: const Text(
          'Are you sure you want to remove this item from your cart?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              // ✅ Pop only the dialog using dialogContext
              Navigator.of(dialogContext).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              // ✅ Pop dialog first, then remove item
              Navigator.of(dialogContext).pop();
              cart.removeFromCart(uniqueKey);
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Product Image ──
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: item.image != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image!,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.themeColor,
                  size: 32,
                ),
              ),
            )
                : Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.themeColor,
              size: 32,
            ),
          ),
          const SizedBox(width: 12),

          // ── Name + Badges + Price ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (item.size != null) _badge(item.size!),
                    if (item.size != null && item.color != null)
                      const SizedBox(width: 6),
                    if (item.color != null) _badge(item.color!),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${item.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // ── Delete + Quantity Controls ──
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🗑 Delete button
              GestureDetector(
                onTap: () => _showDeleteDialog(context),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    size: 16,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // + button
              _qtyButton(
                icon: Icons.add,
                onTap: () =>
                    cart.updateQuantity(item.uniqueKey, item.quantity + 1),
                filled: true,
              ),
              const SizedBox(height: 4),

              // Quantity number
              Text(
                item.quantity.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),

              // - button
              _qtyButton(
                icon: Icons.remove,
                onTap: () =>
                    cart.updateQuantity(item.uniqueKey, item.quantity - 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _badge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.themeColor,
        ),
      ),
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onTap,
    bool filled = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: filled ? AppColors.themeColor : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: filled ? AppColors.themeColor : Colors.grey.shade300,
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: filled ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}