import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ModelosRecord extends FirestoreRecord {
  ModelosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "marca" field.
  DocumentReference? _marca;
  DocumentReference? get marca => _marca;
  bool hasMarca() => _marca != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _marca = snapshotData['marca'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('modelos');

  static Stream<ModelosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModelosRecord.fromSnapshot(s));

  static Future<ModelosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModelosRecord.fromSnapshot(s));

  static ModelosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModelosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModelosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModelosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModelosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModelosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModelosRecordData({
  String? nome,
  DocumentReference? marca,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'marca': marca,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModelosRecordDocumentEquality implements Equality<ModelosRecord> {
  const ModelosRecordDocumentEquality();

  @override
  bool equals(ModelosRecord? e1, ModelosRecord? e2) {
    return e1?.nome == e2?.nome && e1?.marca == e2?.marca;
  }

  @override
  int hash(ModelosRecord? e) => const ListEquality().hash([e?.nome, e?.marca]);

  @override
  bool isValidKey(Object? o) => o is ModelosRecord;
}
