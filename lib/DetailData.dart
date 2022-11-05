// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tyba_prueba/WidgetArguments.dart';

class MyDetailData extends StatelessWidget {
  static const routeName = '/WidgetArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as WidgetArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: const Text('Detalle de la universidad'),
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin: EdgeInsets.all(25),
        shadowColor: Colors.black,
        elevation: 20,
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              padding: const EdgeInsets.all(10),
              children:  <Widget>[
                Card(
                    child: ListTile(
                        title: Text("Nombre universidad:"),
                        subtitle: Text(args.name),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://img.freepik.com/vector-gratis/felices-estudiantes-carreras-mixtas-caminando-frente-ilustracion-plana-edificio-universidad-gente-dibujos-animados-relajandose-patio-campus_74855-14063.jpg?w=2000")))),
                Card(
                    child: ListTile(
                        title: Text("Donde se ubica:"),
                        subtitle: Text(args.country),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png")))),
                Card(
                    child: ListTile(
                        title: Text("Estado:"),
                        subtitle: Text(args.province),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://definicion.de/wp-content/uploads/2013/09/provincia-1.jpg")))),
                Card(
                    child: ListTile(
                        title: Text("Página web"),
                        subtitle: Text(args.webPage),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://d500.epimg.net/cincodias/imagenes/2015/11/20/lifestyle/1448037563_041957_1448037621_noticia_normal.jpg"))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
