import 'package:cloud_firestore/cloud_firestore.dart';
class database{
 // String dataa=UploadMultipleImageDemo.data;

final String uid;

database({this.uid});
  final CollectionReference placeData=Firestore.instance.collection('placeData');
  
  
  Future updateUserData(String dataa,String mark,String points,String id, String counter )async{
    return await placeData.document(uid).setData({
      'data':dataa,
      'access point':mark,
      'access point location':points,
      'uid':id,
      '0':counter,
    });
  }
}