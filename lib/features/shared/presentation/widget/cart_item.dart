import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String? image;
  final String? size;
  final String? color;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    this.image,
    this.size,
    this.color,
  });

  // Unique key based on name + size + color
  // So XL and 2L are treated as separate cart items
  String get uniqueKey => '$name-${size ?? ''}-${color ?? ''}';

  CartItem copyWith({int? quantity}) {
    return CartItem(
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
      image: image,
      size: size,
      color: color,
    );
  }
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  // ─────────────────────────────────────────
  // Getters
  // ─────────────────────────────────────────

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  bool get isEmpty => _items.isEmpty;

  // ─────────────────────────────────────────
  // Add to Cart
  // ─────────────────────────────────────────

  void addToCart(CartItem newItem) {
    // Match by name + size + color so different sizes/colors are separate items
    final index =
    _items.indexWhere((i) => i.uniqueKey == newItem.uniqueKey);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + newItem.quantity,
      );
    } else {
      _items.add(newItem);
    }
    notifyListeners();
  }

  // ─────────────────────────────────────────
  // Remove from Cart
  // ─────────────────────────────────────────

  void removeFromCart(String uniqueKey) {
    _items.removeWhere((i) => i.uniqueKey == uniqueKey);
    notifyListeners();
  }

  // ─────────────────────────────────────────
  // Update Quantity
  // ─────────────────────────────────────────

  void updateQuantity(String uniqueKey, int quantity) {
    final index = _items.indexWhere((i) => i.uniqueKey == uniqueKey);
    if (index != -1) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index] = _items[index].copyWith(quantity: quantity);
      }
      notifyListeners();
    }
  }

  // ─────────────────────────────────────────
  // Clear Cart
  // ─────────────────────────────────────────

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}