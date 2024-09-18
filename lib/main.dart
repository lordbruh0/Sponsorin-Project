import 'package:flutter/material.dart';
import 'package:sponsorin/style/textstyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xFF1EAAFD);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business App',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Selamat Sore Ryo"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 244, 244, 244),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 70, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     CustomText(text: 'Selamat Sore Haza', style: Theme.of(context).textTheme.appBar),
                //     CircleAvatar(
                //       // backgroundImage: AssetImage(""),
                //     ),
                //   ],
                // ),
        
                const CustomText(
                  text: "Selamat Pagi Haza",
                  style: CustomTextStyles.title,
                ),
                const CustomText(text: 'Ingin membuat event apa hari ini', style: CustomTextStyles.subtitle),
                
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _categoryButton("Retail", true, Icons.store),
                      _categoryButton("Makanan", false, Icons.fastfood),
                      _categoryButton("Jasa", false, Icons.handyman),
                      _categoryButton("Kegiatan", false, Icons.event),
                    ],
                  ),
                ),
                // const SizedBox(height: 20),
                // const CustomText(text: 'Rekomendasi Usaha', style: CustomTextStyles.header),
                // const SizedBox(height: 12),
                // _businessCard("iBox", "Apple", Colors.black),
                // SizedBox(height: 8),
                // _businessCard("Informa", "Electronics", Colors.blue),
                // SizedBox(height: 20),
                // Text(
                //   "Usaha lainnya",
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 12),
                // _businessCard(
                //     "Warung Wareg", "Makanan tradisional Indonesia", Colors.red),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavBarIcon(Icons.home, 0),
              _buildNavBarIcon(Icons.business, 1),
              _buildNavBarIcon(Icons.account_circle, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String text, bool isSelected, IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 5),
            CustomText(text: text, style: isSelected ? CustomTextStyles.textButtonMedium : CustomTextStyles.textBottomMediumGray),
          ],
        ),
      ),
    );
  }

  Widget _businessCard(String businessName, String category, Color color) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.store, color: color),
        title:
            Text(businessName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(category),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text('Ajukan kerja sama'),
        ),
      ),
    );
  }

  Widget _buildNavBarIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: CircleAvatar(
        radius: 23,
        backgroundColor: Color.fromARGB(240, 44, 62, 80),
        child: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
