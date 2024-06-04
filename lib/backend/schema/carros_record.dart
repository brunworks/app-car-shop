import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrosRecord extends FirestoreRecord {
  CarrosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "marca" field.
  DocumentReference? _marca;
  DocumentReference? get marca => _marca;
  bool hasMarca() => _marca != null;

  // "modelo" field.
  String? _modelo;
  String get modelo => _modelo ?? '';
  bool hasModelo() => _modelo != null;

  // "kilometragem" field.
  int? _kilometragem;
  int get kilometragem => _kilometragem ?? 0;
  bool hasKilometragem() => _kilometragem != null;

  // "primeiroDono" field.
  bool? _primeiroDono;
  bool get primeiroDono => _primeiroDono ?? false;
  bool hasPrimeiroDono() => _primeiroDono != null;

  // "proprietario" field.
  DocumentReference? _proprietario;
  DocumentReference? get proprietario => _proprietario;
  bool hasProprietario() => _proprietario != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  void _initializeFields() {
    _marca = snapshotData['marca'] as DocumentReference?;
    _modelo = snapshotData['modelo'] as String?;
    _kilometragem = castToType<int>(snapshotData['kilometragem']);
    _primeiroDono = snapshotData['primeiroDono'] as bool?;
    _proprietario = snapshotData['proprietario'] as DocumentReference?;
    _foto = snapshotData['foto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carros');

  static Stream<CarrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarrosRecord.fromSnapshot(s));

  static Future<CarrosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarrosRecord.fromSnapshot(s));

  static CarrosRecord fromSnapshot(DocumentSnapshot snapshot) => CarrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarrosRecordData({
  DocumentReference? marca,
  String? modelo,
  int? kilometragem,
  bool? primeiroDono,
  DocumentReference? proprietario,
  String? foto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'marca': marca,
      'modelo': modelo,
      'kilometragem': kilometragem,
      'primeiroDono': primeiroDono,
      'proprietario': proprietario,
      'foto': foto,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarrosRecordDocumentEquality implements Equality<CarrosRecord> {
  const CarrosRecordDocumentEquality();

  @override
  bool equals(CarrosRecord? e1, CarrosRecord? e2) {
    return e1?.marca == e2?.marca &&
        e1?.modelo == e2?.modelo &&
        e1?.kilometragem == e2?.kilometragem &&
        e1?.primeiroDono == e2?.primeiroDono &&
        e1?.proprietario == e2?.proprietario &&
        e1?.foto == e2?.foto;
  }

  @override
  int hash(CarrosRecord? e) => const ListEquality().hash([
        e?.marca,
        e?.modelo,
        e?.kilometragem,
        e?.primeiroDono,
        e?.proprietario,
        e?.foto
      ]);

  @override
  bool isValidKey(Object? o) => o is CarrosRecord;
}
