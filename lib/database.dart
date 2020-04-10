import 'package:cloud_firestore/cloud_firestore.dart';
class database{
 // String dataa=UploadMultipleImageDemo.data;

final String uid;
database({this.uid});
  final CollectionReference placeData=Firestore.instance.collection('placeData');
  
  
  Future updateUserData(String dataa)async{
    return await placeData.document(uid).setData({
      'data':dataa
    });
  }
}