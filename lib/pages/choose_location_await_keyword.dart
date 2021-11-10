import 'package:flutter/material.dart';

class choose_location extends StatefulWidget {
  const choose_location({Key? key}) : super(key: key);

  @override
  _choose_locationState createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {

  void getData() async {
    String username = await Future.delayed(Duration(seconds: 3), (){
      return 'yoshi';//yoshi gets printed after 3 secs
    });

    //sim network req to get bio of username
    String bio = await Future.delayed(Duration(seconds: 2), (){
      return 'bio -> vegan, musician & egg collector';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('Hey! i get printed first uhwuwhuwh');
  }

  @override
  Widget build(BuildContext context) {
    print('Build Function Ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(//this AppBar will automatically create a back button in the top left
        backgroundColor: Colors.blue[900],
        title: Text('Choose A Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ElevatedButton(
        onPressed: (){},
        child: Text('Click me'),
      ),
    );
  }
}
