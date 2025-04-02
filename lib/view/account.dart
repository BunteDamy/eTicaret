import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proje/constant/constant.dart';

class Account extends ConsumerStatefulWidget {
  const Account({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  // Burada kullanıcının bilgileri için örnek veriler oluşturduk
  String userName = "John Doe";
  String userEmail = "johndoe@example.com";
  String profileImage = "assets/images/im_c1.png"; // Profil resmi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hesap",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Constant.darkWhite,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildAccountOptions(),
            const SizedBox(height: 20),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  // Profil kısmı (Resim, Ad, Email)
  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(profileImage),
            backgroundColor: Constant.white,
          ),
          const SizedBox(height: 16),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            userEmail,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  // Hesap seçenekleri (Ayarlar, Siparişler, vs.)
  Widget _buildAccountOptions() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Profil Bilgileri"),
          onTap: () {
            // Profil bilgileri sayfasına yönlendirme (Örnek olarak)
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text("Bildirimler"),
          onTap: () {
            // Bildirim ayarları sayfasına yönlendirme
          },
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text("Sipariş Geçmişi"),
          onTap: () {
            // Sipariş geçmişi sayfasına yönlendirme
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Ayarlar"),
          onTap: () {
            // Ayarlar sayfasına yönlendirme
          },
        ),
      ],
    );
  }

  // Çıkış butonu
  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Constant.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          "Çıkış Yap",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Constant.white,
          ),
        ),
      ),
    );
  }
}
