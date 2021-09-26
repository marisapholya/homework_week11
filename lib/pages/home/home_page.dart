import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// homepage
class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _titleAppbar = 'FOOD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titleAppbar,
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/me.jpg'),
                      )),
                  Text(
                    'Marisa Pholya',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'pholya_m@silpakorn.edu',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            _subPageIndex == 0
                ? ListTile(
                    title: _buildDrawerItem(
                        Icon(
                          Icons.fastfood,
                          size: 25.0,
                          color: Colors.teal.shade300,
                        ),
                        'Food'),
                    onTap: () => _subpage(0),
                    selected: true,
                  )
                : ListTile(
                    title: _buildDrawerItem(
                      Icon(
                        Icons.fastfood,
                        size: 25.0,
                      ),
                      'Food',
                    ),
                    onTap: () => _subpage(0),
                    selected: false,
                  ),
            _subPageIndex == 1
                ? ListTile(
                    title: _buildDrawerItem(
                        Icon(
                          Icons.person,
                          size: 25.0,
                          color: Colors.teal.shade300,
                        ),
                        'Profile'),
                    onTap: () => _subpage(1),
                    selected: true,
                  )
                : ListTile(
                    title: _buildDrawerItem(
                        Icon(
                          Icons.person,
                          size: 25.0,
                        ),
                        'Profile'),
                    onTap: () => _subpage(1),
                    selected: false,
                  ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: _buildSubPage(),
        ),
      ),
    );
  }

  void _subpage(int index) {
    if(index == 0){
      setState(() {
        _subPageIndex = 0;
        _titleAppbar = "FOOD";
      });
    }else{
      setState(() {
        _subPageIndex = 1;
        _titleAppbar = "PROFILE";
      });
    }
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: return FoodPage();
      case 1: return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 10.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// food & order
class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;
  final screen = [
    Center(
      child: Text(
        'FOOD MENU',
        style : TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    Center(
      child: Text(
        'YOUR ORDER',
        style : TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: screen[_selectedBottomNavIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade500,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}

// profile
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal.shade300,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: Container(
                      width: 160.0,
                      height: 160.0,
                      child: Image.asset('assets/images/me.jpg'),
                    )),
              ),
              Text(
                'Marisa Pholya',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'pholya_m@silpakorn.edu',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
