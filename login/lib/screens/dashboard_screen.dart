import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = "aisyah@test.com";

    List<Map<String, dynamic>> menuItems = [
      {"title": "Home", "icon": Icons.home},
      {"title": "Produk", "icon": Icons.shopping_cart},
      {"title": "Pesanan", "icon": Icons.receipt_long},
      {"title": "Customer", "icon": Icons.people},
      {"title": "Pengaturan", "icon": Icons.settings},
    ];

    List<Map<String, dynamic>> statistik = [
      {"title": "Produk", "value": "25", "icon": Icons.shopping_bag},
      {"title": "Pesanan", "value": "12", "icon": Icons.shopping_cart_checkout},
      {"title": "Customer", "value": "8", "icon": Icons.people},
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),

      body: Row(
        children: [
          /// SIDEBAR
          Container(
            width: 240,
            color: const Color(0xff111827),

            child: Column(
              children: [
                const SizedBox(height: 40),

                const CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,

                  child: Icon(Icons.person, color: Colors.black, size: 40),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Admin Panel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(email, style: const TextStyle(color: Colors.white70)),

                const SizedBox(height: 40),

                /// MENU
                Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,

                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),

                          color: index == 0
                              ? Colors.white10
                              : Colors.transparent,
                        ),

                        child: ListTile(
                          leading: Icon(
                            menuItems[index]["icon"],
                            color: Colors.white,
                          ),

                          title: Text(
                            menuItems[index]["title"],
                            style: const TextStyle(color: Colors.white),
                          ),

                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),

                /// LOGOUT
                Padding(
                  padding: const EdgeInsets.all(15),

                  child: SizedBox(
                    width: double.infinity,

                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 141, 40, 38),
                        padding: const EdgeInsets.symmetric(vertical: 15),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },

                      icon: const Icon(Icons.logout),

                      label: const Text("Logout"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// HEADER
                  const Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Selamat datang kembali 👋",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  /// STATISTIK
                  Row(
                    children: statistik.map((item) {
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),

                          padding: const EdgeInsets.all(20),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(20),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),

                                blurRadius: 10,
                              ),
                            ],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Icon(item["icon"], size: 35),

                              const SizedBox(height: 20),

                              Text(
                                item["value"],
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                item["title"],
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  /// DATA LIST
                  const Text(
                    "Aktivitas Terbaru",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,

                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),

                          padding: const EdgeInsets.all(18),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(16),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),

                                blurRadius: 8,
                              ),
                            ],
                          ),

                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue.shade100,

                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.blue,
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      "Aktivitas ${index + 1}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    const Text(
                                      "Data berhasil diperbarui",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
