//Images
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:io';
import 'agenda.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

void main() => runApp(new FirstApp());
// Screen do inidcio do app

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'PIPR App', home: new GavetaScreen());
  }
}

class GavetaScreen extends StatelessWidget {
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('PIPR'),
        backgroundColor: Colors.green,
      ),
      body: Center(child: MainScreen()),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(children: [
                new Container(
                    constraints: new BoxConstraints.expand(
                      height: 100.0,
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/logo-wire.png'),
                        fit: BoxFit.fill,
                      ),
                    )),
                new Container(
                    constraints: new BoxConstraints.expand(
                      height: 28.0,
                    ),
                    child: Text("Primeira Igreja Presbiteriana de Roraima",
                        style: new TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))
              ]),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Inicio PIPR'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Quem Somos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new QuemSomosScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Website'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                const url = 'http://www.pipr.org.br/';
                launch(url);
              },
            ),
            ListTile(
              title: Text('Biblia Online'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                const url = 'https://www.bibliaonline.com.br/acf/index';
                launch(url);
              },
            ),
            ListTile(
              title: Text('Culto Ao Vivo'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CultoScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Boletins'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new BoletinsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Nosso Canal'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                const url = 'https://www.youtube.com/user/piprrtv/videos/';
                launch(url);
              },
            ),
            ListTile(
              title: Text('Nosso endereço'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                const url =
                    'https://www.google.com/maps/place/Primeira+Igreja+Presbiteriana+de+Roraima/@2.8250649,-60.6740316,16.27z/data=!4m12!1m6!3m5!1s0x0:0x8b9f5b0ee29353b8!2sGaleria+vida!8m2!3d2.828348!4d-60.674752!3m4!1s0x8d93060cae68569b:0xde85d3da073d7615!8m2!3d2.8256367!4d-60.671183?hl=pt-BR';
                launch(url);
              },
            ),
            ListTile(
              title: Text('Contato'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                const url = 'tel://9532242330';
                launch(url);
              },
            ),
            ListTile(
              title: Text('Agenda'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new AgendaScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Sociedades Internas'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SociedadeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Dados Bancários'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new BankScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Documentos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new DocumentosScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(children: [
        Image.asset('assets/images/pipr.png'),
        Expanded(child: Text('TEstatndo')),
        //Row(Text('teste')),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Flexible(
              child: Text(
                  "Primeira Igreja Presbiteriana de Roraima\nRua Barão do Rio Branco, 999, Centro\nBoa Vista - RR")),
          Column(children: [
            RaisedButton(
                highlightColor: Colors.white,
                color: Colors.white,
                child: Image.asset('assets/icons/twitter.png', width: 60),
                onPressed: () {
                  const url = 'https://twitter.com/piprr';
                  launch(url);
                }),
            RaisedButton(
                highlightColor: Colors.white,
                color: Colors.white,
                child:
                    Image.asset('assets/icons/facebook-like.jpeg', width: 60),
                onPressed: () {
                  const url = 'http://facebook.com/piprr';
                  launch(url);
                }),
            RaisedButton(
                color: Colors.white,
                child: Image.asset('assets/icons/youtube.jpg', width: 60),
                onPressed: () {
                  const url = 'https://www.youtube.com/user/piprrtv/videos/';
                  launch(url);
                })
          ]),
        ])
      ]),
    );
  }
}

class BankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Dados Bancários"), backgroundColor: Colors.green),
        body: Column(children: [
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[Text('Banco do Brasil:')],
              ),
              Row(
                children: <Widget>[
                  Text('Agência: 2617-4'),
                  FlatButton(
                    child: Icon(Icons.content_copy),
                    onPressed: () {
                      ClipboardManager.copyToClipBoard("2617-4");
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Conta Corrente: 32.272-5'),
                  FlatButton(
                    child: Icon(Icons.content_copy),
                    onPressed: () {
                      ClipboardManager.copyToClipBoard("32.272-5");
                    },
                  )
                ],
              )
              ,
              Row(
                children: <Widget>[
                  Text('Cnpj: 05.946.652/0001-37'),
                  FlatButton(
                    child: Icon(Icons.content_copy),
                    onPressed: () {
                      ClipboardManager.copyToClipBoard("05946652000137");
                    },
                  )
                ],
              )
            ],
          )
        ]));
  }
}

//screen do Culto Online

class SociedadeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Sociedades Internas"),
            backgroundColor: Colors.green),
        body: Column(children: []));
  }
}

//screen do Culto Online

class BoletinsScreen extends StatelessWidget {
  String url = "http://www.pipr.org.br/ao-vivo";

  @override
  Widget build(BuildContext ctxt) {
    return new WebviewScaffold(
      url: "https://pt.scribd.com/user/248487760/araujojesse",
      appBar: new AppBar(
        title: new Text("Arquivo de Boletins"),
        backgroundColor: Colors.green,
      ),
    );
  }
}

//screen do Culto Online

class CultoScreen extends StatelessWidget {
  String url = "http://www.pipr.org.br/ao-vivo";

  @override
  Widget build(BuildContext ctxt) {
    return new WebviewScaffold(
      url: "http://www.pipr.org.br/ao-vivo",
      appBar: new AppBar(
        title: new Text("Culto Online"),
        backgroundColor: Colors.green,
      ),
    );
  }
}

// screen de documentos

class DocumentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Documentos"), backgroundColor: Colors.green),
        body: Column(children: [
          RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                const url =
                    'http://www.monergismo.com/textos/catecismos/brevecatecismo_westminster.htm';
                launch(url);
              },
              child: Text('Breve Catecismo de Westminister')),
          RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                const url =
                    'http://www.monergismo.com/textos/catecismos/catecismomaior_westminster.htm';
                launch(url);
              },
              child: Text('Catecismo Maior de Westminister')),
          RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                const url =
                    'http://www.executivaipb.com.br/arquivos/confissao_de_westminster.pdf';
                launch(url);
              },
              child: Text('Confissão de Fé Westminister'))
        ]));
  }
}

class QuemSomosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Quem Somos"), backgroundColor: Colors.green),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(child: Text("""
Somos herdeiros da Reforma Protestante. A Reforma Protestante foi um movimento iniciado no século 16 por um monge católico chamado Martinho Lutero, seguido por dezenas de padres e por grande parte do povo. Este grupo de católicos não aceitava mais os erros que estavam sendo cometidos pela Igreja Católica Apostólica Romana. 

A Reforma Protestante teve início na Alemanha e rapidamente se espalhou por toda a Europa. Uma das Igrejas que nasceram neste período foi a Igreja Presbiteriana. Fundada na Escócia por John Knox, também no século 16, recebeu este nome em referência ao sistema de governo da Igreja Primitiva, cuja administração era feita por presbíteros (anciãos).

No Brasil, o presbiterianismo começou definitivamente em 1859, com a vinda do jovem missionário americano Ashbel Green Simonton. De lá pra cá, o Brasil tem sido testemunha da atuação abençoada do povo presbiteriano em todas as áreas da sociedade.

Nossa igreja faz parte da Igreja Presbiteriana do Brasil, vendo-se tanto como herdeira como fiel expositora da Palavra de Deus de acordo com os Símbolos de Fé: Catecismo Maior, Breve Catecismo e Confissão de Fé de Westminster. 

              """, textAlign: TextAlign.justify))));
  }
}
