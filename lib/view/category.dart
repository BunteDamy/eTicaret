import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Apple ürünlerinin kategorilerini tutacak veriler
class CategoryData {
  final String icon;
  final String name;
  final String description;

  CategoryData({
    required this.icon,
    required this.name,
    required this.description,
  });
}

class Category extends ConsumerStatefulWidget {
  const Category({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {
  // Apple ürün kategorileri
  final List<CategoryData> categories = [
    CategoryData(
      icon: 'assets/images/im_p1.png', // Apple iPhone simgesi
      name: "iPhone",
      description: "Explore the latest iPhone models",
    ),

    CategoryData(
      icon: 'assets/images/im_c1.png', // Apple MacBook simgesi
      name: "MacBook",
      description: "Find the latest MacBooks",
    ),
    CategoryData(
      icon: 'assets/images/im_w1.png', // Apple Watch simgesi
      name: "Apple Watch",
      description: "Smartwatches from Apple",
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Apple Products",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 sütunlu bir grid
            crossAxisSpacing: 16.0, // Sütunlar arası boşluk
            mainAxisSpacing: 16.0, // Satırlar arası boşluk
            childAspectRatio: 0.9, // Her bir grid öğesinin oranı
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                // Kategoriye tıklanınca o kategoriye ait ürünleri göster
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListPage(categoryName: category.name),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        category.icon,
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Ürün listesi sayfası
class ProductListPage extends StatelessWidget {
  final String categoryName;

  const ProductListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Burada categoryName'e göre ilgili Apple ürünlerini listeleyeceğiz
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text(
          'Displaying products for $categoryName',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
