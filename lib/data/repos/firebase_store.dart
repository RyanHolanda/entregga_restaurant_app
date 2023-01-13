import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entreggue_restaurant/data/models/adresses_model.dart';
import 'package:entreggue_restaurant/data/models/store_couriers_model.dart';
import 'package:entreggue_restaurant/data/models/store_id_model.dart';
import 'package:entreggue_restaurant/domain/auth/auth.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class Storage {
  final user = Auth().currentUser;
  late final String storeCreatedUid = user!.uid.substring(0, 5);
  late final String courierCreatedUid =
      Timestamp.now().millisecondsSinceEpoch.toString();
  final storage = FirebaseFirestore.instance.collection('stores');
}

class FetchFromStorage extends Storage {
  Future fetchStoreIdFromStorage() async {
    final ref = storage.doc(storeCreatedUid).withConverter(
        fromFirestore: StoreIdModel.fromFirestore,
        toFirestore: (StoreIdModel storeId, _) => StoreIdModel().toFirestore());
    final docSnap = await ref.get();
    final storeId = docSnap.data();
    if (storeId != null) {
      return storeIdModelString = storeId.storeId;
    } else {
      await storage
          .doc(storeCreatedUid)
          .set({'storeId': storeCreatedUid, 'storeEmail': user!.email});
      await fetchStoreIdFromStorage();
    }
  }

  Future<List<StoreCouriers>> getAllCouriers() async {
    final ref = storage.doc(storeCreatedUid).collection('couriers');
    QuerySnapshot querySnapshot = await ref.get();
    final List data = querySnapshot.docs.map((doc) => doc.data()).toList();
    return data.map((data) => StoreCouriers.fromMap(data)).toList();
  }

  Future<List<AddressesModel>> getAdressesByCourier(courierId) async {
    final ref = storage
        .doc(storeCreatedUid)
        .collection('couriers')
        .doc(courierId)
        .collection('addresses');
    QuerySnapshot querySnapshot = await ref.get();
    final List data = querySnapshot.docs.map((doc) => doc.data()).toList();
    return data.map((data) => AddressesModel.fromMap(data)).toList();
  }
}

class AddToStorage extends Storage {
  addCourierToStorage(courierName) async {
    await storage
        .doc(storeCreatedUid)
        .collection('couriers')
        .doc(courierCreatedUid)
        .set({
      'courierName': courierName,
      'courierUid': courierCreatedUid,
    });
  }

  addAdressToCourier(
      courierId, clientName, Map<String, dynamic> dataToAdd) async {
    await storage
        .doc(storeCreatedUid)
        .collection('couriers')
        .doc(courierId)
        .collection('addresses')
        .doc(clientName)
        .set(dataToAdd);
  }
}

class RemoveFromStorage extends Storage {
  removeCourierFromStorage(courierId) async {
    await storage
        .doc(storeCreatedUid)
        .collection('couriers')
        .doc(courierId)
        .delete();
  }
}
