import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MarcasRecord extends FirestoreRecord {
  MarcasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('marcas');

  static Stream<MarcasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarcasRecord.fromSnapshot(s));

  static Future<MarcasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarcasRecord.fromSnapshot(s));

  static MarcasRecord fromSnapshot(DocumentSnapshot snapshot) => MarcasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarcasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarcasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarcasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarcasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarcasRecordData({
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarcasRecordDocumentEquality implements Equality<MarcasRecord> {
  const MarcasRecordDocumentEquality();

  @override
  bool equals(MarcasRecord? e1, MarcasRecord? e2) {
    return e1?.nome == e2?.nome;
  }

  @override
  int hash(MarcasRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is MarcasRecord;
}
