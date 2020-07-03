import 'package:cloud_firestore/cloud_firestore.dart';
class count{
 // String dataa=UploadMultipleImageDemo.data;

final String uid;

count({this.uid});
  final CollectionReference counters=Firestore.instance.collection('counters');
  
  
  Future update(String counterr)async{
    return await counters.document(uid).setData({
'0':counterr,
    });
  }
}