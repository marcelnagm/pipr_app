
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

//screen da agenda e classes depedente


class Evento{
  String titulo = '';
  String data_inicio;
  String data_fim;
  String link;
  String local;
  Evento(this.titulo,this.data_inicio,this.data_fim,this.link,this.local);

  String getInicio() {
    return this.formatterDate(this.data_inicio);
  }

  String getFim() {
    return this.formatterDate(this.data_fim);
  }

  String formatterDate(String data){
    data= data.replaceAll('dateTime:', '')
        .replaceAll('{', '')
        .replaceAll('}', '').trim();
    var part = data.substring(8,10)+'/'+data.substring(5,7)+'/'+data.substring(0,4);
    data=null;
    return part;
  }

  String formatterTime(String _data){
    _data= _data.replaceAll('dateTime:', '')
        .replaceAll('{', '')
        .replaceAll('}', '').trim();
    var part = _data.substring(_data.indexOf('T')+1,_data.indexOf('T')+6);
    return part;
  }



  String getHoraInicio(){
    return this.formatterTime(this.data_inicio) ;
  }

  String getHoraFim(){
    return this.formatterTime(this.data_fim) ;
  }

  Evento._({this.titulo,this.data_inicio,this.data_fim,this.link,this.local});

  factory Evento.fromJson(Map<String, dynamic> json) {
    return new Evento(
      json['summary'].toString(),
      json['start'].toString(),
      json['end'].toString(),
      json['htmlLink'].toString(),
      json['location'].toString(),
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return titulo+" - "+data_inicio;
  }

}


class AgendaScreen extends StatefulWidget {
  State createState() => new DyanmicList();
}



class DyanmicList extends State<AgendaScreen> {
  Future<List<Evento>>  list ;
  var url;
  var dados;



  Future<List<Evento>> fetchEventos() async {
    url = 'https://www.googleapis.com/calendar/v3/calendars/u6skpfm9o7bgv6g3gf83n6faik@group.calendar.google.com/events?key=AIzaSyD25iC0PwfBYFLckTaKUXKMDMlR_rMlDVs&maxResults=10&timeMin='+DateTime.now().toUtc().toIso8601String();
    print(url);
    final response =
    await  http.get(url);
    List<Evento> temp = new List();
    var jsonResponse = json.decode(response.body);
    dados = jsonResponse['items'];
    for(var i =0;i<dados.length;i++) {
      temp.add(new Evento.fromJson(dados[i]));
    }
    return temp;
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Evento> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
                title: new Text(values[index].titulo)
                ,subtitle:   Row(
                children: [
                  new Flexible(
                      child: new Column(
                          children: [Text('Inicio: '+values[index].getInicio()+' - '+values[index].getHoraInicio()
                              +"\n\nFim:    "+values[index].getFim()+' - '+values[index].getHoraFim()+"\n\nLocal:"+values[index].local
                              ,
                              textAlign: TextAlign.justify)]
                      )
                  )
                  ,
                  new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[Padding(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                var url = values[index].link;
                                launch(url);
                              },
                              child:
                              Row(
                                children: <Widget>[
                                  Icon(Icons.list),
                                  Text('Detalhes')],
                              )

                          )
                      )
                      ,RaisedButton(
                          onPressed: () {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if(!values[index].local.contains('null')) {
                              var url = 'https://www.google.com.br/maps/search/' +
                                  values[index].local;
                              launch(url);
                            }
                          },
                          child:
                          Row(
                            children: <Widget>[
                              Icon(Icons.map),
                              Text('Local')],
                          )

                      )
                      ])
                ])
            )
            ,

            new Divider(height: 2.0,),
          ],
        );
      },
    );
  }


  @override
  Widget build (BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Agenda"),
          backgroundColor: Colors.green,
        ),
        body:  new FutureBuilder(
          future: fetchEventos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return new Text('loading...');
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return createListView(context, snapshot);
            }
          },
        )
    );
  }


}

