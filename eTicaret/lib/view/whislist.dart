import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proje/components/product_card.dart'; // ProductCard import
import 'package:proje/model/product.dart';

// Favori ürünleri tutacak provider
final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<Product>>((ref) {
  return WishlistNotifier();
});

// Favori ürünleri yönetecek notifier
class WishlistNotifier extends StateNotifier<List<Product>> {
  WishlistNotifier() : super([]);

  // Ürünü listeye ekle/çıkar
  void toggleWishlist(Product product) {
    final isExist = state.any((item) => item.id == product.id);
    if (isExist) {
      state = state.where((item) => item.id != product.id).toList();
    } else {
      state = [...state, product.copyWith(isSaved: true)];
    }
  }

  // Tüm ürünleri temizle
  void clearWishlist() {
    state = [];
  }
}

class Wishlist extends ConsumerStatefulWidget {
  const Wishlist({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistState();
}

class _WishlistState extends ConsumerState<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final wishlistItems = ref.watch(wishlistProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("İstek Listesi", 
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (wishlistItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep, color: Colors.black),
              onPressed: () {
                _showClearConfirmation(context);
              },
            )
        ],
      ),
      body: wishlistItems.isEmpty 
          ? _buildEmptyWishlist() 
          : _buildWishlistGrid(wishlistItems),
    );
  }

  Widget _buildEmptyWishlist() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border_rounded, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            "İstek listeniz boş",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Favori ürünlerinizi ekleyin",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistGrid(List<Product> items) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ProductCard(product: items[index]),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    ref.read(wishlistProvider.notifier).toggleWishlist(items[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showClearConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("İstek Listesini Temizle"),
          content: const Text("Tüm ürünleri istek listenizden kaldırmak istediğinize emin misiniz?"),
          actions: [
            TextButton(
              child: const Text("İptal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Temizle", style: TextStyle(color: Colors.red)),
              onPressed: () {
                ref.read(wishlistProvider.notifier).clearWishlist();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}