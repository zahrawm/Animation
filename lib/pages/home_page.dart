import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> images = [
  'https://womensfitness.co.uk/wp-content/uploads/sites/3/2022/11/Shutterstock_1675475479.jpg?w=900',
  'https://www.aljazeera.com/wp-content/uploads/2022/11/SOR01872.jpg?resize=1920%2C1440',
  'https://cdn.britannica.com/21/128421-050-BD03AB22/Accra-Ghana.jpg'
      ''
];

class _HomePageState extends State<HomePage> {
  double _height = 70;
  double _width = 50;
  animate({required double width, required double height}) {
    if (_height == 70 && _width == 50) {
      setState(() {
        _height = height;
        _width = width;
      });
    } else {
      setState(() {
        _height = 70;
        _width = 50;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => animate(width: 60, height: 300),
        child: Icon(Icons.ac_unit_rounded),
      ),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Animations",
            style: TextStyle(color: Colors.blue),
          )),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _height,
              width: _width,
              curve: Curves.bounceInOut,
              color: Colors.amberAccent,
              child: InkWell(
                onTap: () {
                  animate(width: 200, height: 500);
                },
                child: Image.asset(
                  'assets/dubai.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.network(images[index]);
                    }))
          ],
        ),
      ),
    );
  }
}
