import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui' as ui;
import 'package:home_screen_design/pages/my_flutter_app_icons.dart'
    as CustomIcons;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  //Card item
  Widget myItems(IconData icon, String title, Color color) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          highlightColor: color.withOpacity(1.0),
          onTap: () {},
          child: Material(
            color: Colors.white.withOpacity(0.9),
            elevation: 12.0,
            shadowColor: Colors.black,
            borderRadius: BorderRadius.circular(6.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: _buildColumn(title, icon, color),
                    flex: 1,
                    fit: FlexFit.tight,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Construye el texto centrado
  Widget _buildText(String title, Color color) {
    return Center(
      child: Text(title,
          textAlign: TextAlign.center, style: style.copyWith(color: color)),
    );
  }

//Construye la fila del texto
  Widget _buildTextRow(String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
            child: Container(color: Colors.transparent),
            flex: 1,
            fit: FlexFit.tight),
        Flexible(
          child: _buildText(title, color),
          flex: 3,
          fit: FlexFit.loose,
        ),
        Flexible(
            child: Container(color: Colors.transparent),
            flex: 1,
            fit: FlexFit.tight)
      ],
    );
  }

//Construye el icono
  Widget _buildIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Icon(
        icon,
        color: color,
        size: MediaQuery.of(context).size.height * 0.07,
      ),
    );
  }

//Construye las columnas
  Widget _buildColumn(String title, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //Icon
        Flexible(child: _buildIcon(icon, color), flex: 3, fit: FlexFit.loose),
        //Text
        Flexible(
            child: _buildTextRow(title, color), flex: 1, fit: FlexFit.loose),
      ],
    );
  }

//Construye el perfil
  Widget _buildProfile(IconData icon, String title, Color color) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          highlightColor: color.withOpacity(1.0),
          onTap: () {},
          child: Material(
              color: Colors.white.withOpacity(0.9),
              elevation: 12.0,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(6.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                          child: Text(
                        title,
                        style: style.copyWith(color: color),
                        textAlign: TextAlign.center,
                      )),
                      flex: 3,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Center(
                          child: Container(
                        child: Icon(
                          icon,
                          color: color,
                        ),
                        margin: const EdgeInsets.all(5.0),
                      )),
                      flex: 1,
                      fit: FlexFit.tight,
                    )
                  ])),
        ),
      ),
    );
  }

//Junta y construye todo el contenido
  Widget _buildContent() {
    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 16.0),
      children: <Widget>[
        Container(),
        myItems(CustomIcons.MyFlutterApp.money, 'Movimientos en bolsa',
            Color.fromRGBO(23, 17, 85, 1)),
        myItems(CustomIcons.MyFlutterApp.chart_bars, 'Movimientos en fondo',
            Color.fromRGBO(23, 17, 85, 1)),
        myItems(CustomIcons.MyFlutterApp.database_1, 'Movimientos consolidados',
            Color.fromRGBO(23, 17, 85, 1)),
        myItems(CustomIcons.MyFlutterApp.book, 'Estado de Cuenta',
            Color.fromRGBO(23, 17, 85, 1)),
        _buildProfile(CustomIcons.MyFlutterApp.user, 'Ronald Vega',
            Color.fromRGBO(23, 17, 85, 1))
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, MediaQuery.of(context).size.height * 0.20),
        StaggeredTile.extent(1, MediaQuery.of(context).size.height * 0.25),
        StaggeredTile.extent(1, MediaQuery.of(context).size.height * 0.25),
        StaggeredTile.extent(1, MediaQuery.of(context).size.height * 0.25),
        StaggeredTile.extent(1, MediaQuery.of(context).size.height * 0.25),
        StaggeredTile.extent(2, MediaQuery.of(context).size.height * 0.10),
      ],
    );
  }

  TextStyle style =
      TextStyle(fontFamily: 'Montserrat', fontSize: 14.0, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: Color.fromRGBO(23, 17, 85, 1),
                child: _buildText('Bienvenido a Servicios Generales Bursatiles',
                    Colors.white),
              ),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }
}
