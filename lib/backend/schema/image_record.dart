import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'image_record.g.dart';

abstract class ImageRecord implements Built<ImageRecord, ImageRecordBuilder> {
  static Serializer<ImageRecord> get serializer => _$imageRecordSerializer;

  @BuiltValueField(wireName: 'ImageName')
  String? get imageName;

  @BuiltValueField(wireName: 'ImageCategory')
  String? get imageCategory;

  String? get imagedescription;

  DateTime? get imageUplaodDate;

  DocumentReference? get imageUserRefrence;

  double? get imageViewCount;

  @BuiltValueField(wireName: 'is_featured')
  bool? get isFeatured;

  String? get imagePath;

  @BuiltValueField(wireName: 'is_adson')
  bool? get isAdson;

  @BuiltValueField(wireName: 'is_published')
  bool? get isPublished;

  @BuiltValueField(wireName: 'is_draft')
  bool? get isDraft;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ImageRecordBuilder builder) => builder
    ..imageName = ''
    ..imageCategory = ''
    ..imagedescription = ''
    ..imageViewCount = 0.0
    ..isFeatured = false
    ..imagePath = ''
    ..isAdson = false
    ..isPublished = false
    ..isDraft = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('image');

  static Stream<ImageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ImageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ImageRecord._();
  factory ImageRecord([void Function(ImageRecordBuilder) updates]) =
      _$ImageRecord;

  static ImageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createImageRecordData({
  String? imageName,
  String? imageCategory,
  String? imagedescription,
  DateTime? imageUplaodDate,
  DocumentReference? imageUserRefrence,
  double? imageViewCount,
  bool? isFeatured,
  String? imagePath,
  bool? isAdson,
  bool? isPublished,
  bool? isDraft,
}) {
  final firestoreData = serializers.toFirestore(
    ImageRecord.serializer,
    ImageRecord(
      (i) => i
        ..imageName = imageName
        ..imageCategory = imageCategory
        ..imagedescription = imagedescription
        ..imageUplaodDate = imageUplaodDate
        ..imageUserRefrence = imageUserRefrence
        ..imageViewCount = imageViewCount
        ..isFeatured = isFeatured
        ..imagePath = imagePath
        ..isAdson = isAdson
        ..isPublished = isPublished
        ..isDraft = isDraft,
    ),
  );

  return firestoreData;
}
