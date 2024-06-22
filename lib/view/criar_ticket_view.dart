import 'package:flutter/material.dart';

import '../widgets/ticket_form.dart';

class CriarTicketView extends StatelessWidget{

    @override  
    Widget build (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Criar Novo Ticket'),
        ),
        body: TicketForm(),
      );
    }


}