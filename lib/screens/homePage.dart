import 'package:estates_identifier/widgets/DepartmentWidget.dart';
import 'package:estates_identifier/widgets/homeWidget.dart';
import 'package:estates_identifier/widgets/houseWidget.dart';
import 'package:estates_identifier/widgets/landsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final String phoneNumber;


  HomePage(this.userName, this.phoneNumber);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
   HomeWidget(),
    LandsWidget(),
    HouseWidget(),
    DepartmentWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final HomePage args = ModalRoute.of(context).settings.arguments;
    print(args.phoneNumber);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
           new UserAccountsDrawerHeader(
             accountName: Text("${args.userName}"),
             accountEmail: Text("${args.phoneNumber}"),
           ),
            ListTile(
              title: Text('Add Land'),
              leading: SizedBox(
                width: 50,
                height: 40,
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/region.png',fit: BoxFit.cover,),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 20,
                          height: 20,
                          color:Theme.of(context).primaryColor ,
                          child: Icon(Icons.add,size: 20,)),
                    )
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                //TODO S
                // ...
                Navigator.of(context).pushNamed('/addLand');
              },
            ),ListTile(
              title: Text('Add Home'),
              leading: SizedBox(
                width: 50,
                height: 40,
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/home.png',fit: BoxFit.cover,),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: 20,
                          height: 20,
                          color:Theme.of(context).primaryColor ,
                          child: Icon(Icons.add,size: 20,)),
                    )
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.of(context).pushNamed('/addHouse');

              },
            ),
            ListTile(
              title: Text('Add Department'),
              leading: SizedBox(
                width: 50,
                height: 40,
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/department.png',fit: BoxFit.cover,),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: 20,
                          height: 20,
                          color:Theme.of(context).primaryColor ,
                          child: Icon(Icons.add,size: 20,)),
                    )
                  ],
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.of(context).pushNamed('/addDepartment');

              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/region.png")),
            title: Text('Land List'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/home.png")),
            title: Text('home List'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/department.png")),
            title: Text('Department List'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Estates ID"),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
    ),
      
    );
  }
}
