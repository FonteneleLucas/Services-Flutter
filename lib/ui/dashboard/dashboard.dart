import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ListView.builder(
        // padding: EdgeInsets.all(5),
        itemCount: 5,
        itemBuilder: (context, i) => Card(
          // margin: EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Titulo'),
                    Text('Subtitulo'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Preço'),
                    RaisedButton(
                      child: Text('Visualizar'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/details', arguments: i);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}