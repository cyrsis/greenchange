import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Bloc/GloabBloc/GlobalBloc.dart';
import './GMAddCardWidget.dart';
import '../../Styles/AppStyleExport.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: AppStream.StripeCard(globalBloc.User.uid),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.documents.length == 0) return GMAddCardWidget();
            if (snapshot.data.documents.length != 0) {
              return _buildList(context, snapshot.data.documents);
            }
          }
          return Container(width: 0.0, height: 0.0);
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> documents) {
    return Container(
      color: Colors.blue,
      width: 200.0,
      height: 120.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('${documents[0].data["card"]["brand"]}'),
          new Text('${documents[0].data["card"]["cvc_check"]}'),
          new Text('${documents[0].data["card"]["exp_month"]}'),
          new Text('${documents[0].data["card"]["exp_year"]}'),
        ],
      ),
    );
  }
}
