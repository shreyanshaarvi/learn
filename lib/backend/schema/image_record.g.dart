// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageRecord> _$imageRecordSerializer = new _$ImageRecordSerializer();

class _$ImageRecordSerializer implements StructuredSerializer<ImageRecord> {
  @override
  final Iterable<Type> types = const [ImageRecord, _$ImageRecord];
  @override
  final String wireName = 'ImageRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ImageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.imageName;
    if (value != null) {
      result
        ..add('ImageName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageCategory;
    if (value != null) {
      result
        ..add('ImageCategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imagedescription;
    if (value != null) {
      result
        ..add('imagedescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageUplaodDate;
    if (value != null) {
      result
        ..add('imageUplaodDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.imageUserRefrence;
    if (value != null) {
      result
        ..add('imageUserRefrence')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.imageViewCount;
    if (value != null) {
      result
        ..add('imageViewCount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.isFeatured;
    if (value != null) {
      result
        ..add('is_featured')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.imagePath;
    if (value != null) {
      result
        ..add('imagePath')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isAdson;
    if (value != null) {
      result
        ..add('is_adson')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isPublished;
    if (value != null) {
      result
        ..add('is_published')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isDraft;
    if (value != null) {
      result
        ..add('is_draft')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ImageRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ImageName':
          result.imageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ImageCategory':
          result.imageCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imagedescription':
          result.imagedescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUplaodDate':
          result.imageUplaodDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'imageUserRefrence':
          result.imageUserRefrence = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'imageViewCount':
          result.imageViewCount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'is_featured':
          result.isFeatured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'imagePath':
          result.imagePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_adson':
          result.isAdson = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_published':
          result.isPublished = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_draft':
          result.isDraft = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageRecord extends ImageRecord {
  @override
  final String? imageName;
  @override
  final String? imageCategory;
  @override
  final String? imagedescription;
  @override
  final DateTime? imageUplaodDate;
  @override
  final DocumentReference<Object?>? imageUserRefrence;
  @override
  final double? imageViewCount;
  @override
  final bool? isFeatured;
  @override
  final String? imagePath;
  @override
  final bool? isAdson;
  @override
  final bool? isPublished;
  @override
  final bool? isDraft;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ImageRecord([void Function(ImageRecordBuilder)? updates]) =>
      (new ImageRecordBuilder()..update(updates))._build();

  _$ImageRecord._(
      {this.imageName,
      this.imageCategory,
      this.imagedescription,
      this.imageUplaodDate,
      this.imageUserRefrence,
      this.imageViewCount,
      this.isFeatured,
      this.imagePath,
      this.isAdson,
      this.isPublished,
      this.isDraft,
      this.ffRef})
      : super._();

  @override
  ImageRecord rebuild(void Function(ImageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageRecordBuilder toBuilder() => new ImageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageRecord &&
        imageName == other.imageName &&
        imageCategory == other.imageCategory &&
        imagedescription == other.imagedescription &&
        imageUplaodDate == other.imageUplaodDate &&
        imageUserRefrence == other.imageUserRefrence &&
        imageViewCount == other.imageViewCount &&
        isFeatured == other.isFeatured &&
        imagePath == other.imagePath &&
        isAdson == other.isAdson &&
        isPublished == other.isPublished &&
        isDraft == other.isDraft &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, imageName.hashCode),
                                                imageCategory.hashCode),
                                            imagedescription.hashCode),
                                        imageUplaodDate.hashCode),
                                    imageUserRefrence.hashCode),
                                imageViewCount.hashCode),
                            isFeatured.hashCode),
                        imagePath.hashCode),
                    isAdson.hashCode),
                isPublished.hashCode),
            isDraft.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImageRecord')
          ..add('imageName', imageName)
          ..add('imageCategory', imageCategory)
          ..add('imagedescription', imagedescription)
          ..add('imageUplaodDate', imageUplaodDate)
          ..add('imageUserRefrence', imageUserRefrence)
          ..add('imageViewCount', imageViewCount)
          ..add('isFeatured', isFeatured)
          ..add('imagePath', imagePath)
          ..add('isAdson', isAdson)
          ..add('isPublished', isPublished)
          ..add('isDraft', isDraft)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ImageRecordBuilder implements Builder<ImageRecord, ImageRecordBuilder> {
  _$ImageRecord? _$v;

  String? _imageName;
  String? get imageName => _$this._imageName;
  set imageName(String? imageName) => _$this._imageName = imageName;

  String? _imageCategory;
  String? get imageCategory => _$this._imageCategory;
  set imageCategory(String? imageCategory) =>
      _$this._imageCategory = imageCategory;

  String? _imagedescription;
  String? get imagedescription => _$this._imagedescription;
  set imagedescription(String? imagedescription) =>
      _$this._imagedescription = imagedescription;

  DateTime? _imageUplaodDate;
  DateTime? get imageUplaodDate => _$this._imageUplaodDate;
  set imageUplaodDate(DateTime? imageUplaodDate) =>
      _$this._imageUplaodDate = imageUplaodDate;

  DocumentReference<Object?>? _imageUserRefrence;
  DocumentReference<Object?>? get imageUserRefrence =>
      _$this._imageUserRefrence;
  set imageUserRefrence(DocumentReference<Object?>? imageUserRefrence) =>
      _$this._imageUserRefrence = imageUserRefrence;

  double? _imageViewCount;
  double? get imageViewCount => _$this._imageViewCount;
  set imageViewCount(double? imageViewCount) =>
      _$this._imageViewCount = imageViewCount;

  bool? _isFeatured;
  bool? get isFeatured => _$this._isFeatured;
  set isFeatured(bool? isFeatured) => _$this._isFeatured = isFeatured;

  String? _imagePath;
  String? get imagePath => _$this._imagePath;
  set imagePath(String? imagePath) => _$this._imagePath = imagePath;

  bool? _isAdson;
  bool? get isAdson => _$this._isAdson;
  set isAdson(bool? isAdson) => _$this._isAdson = isAdson;

  bool? _isPublished;
  bool? get isPublished => _$this._isPublished;
  set isPublished(bool? isPublished) => _$this._isPublished = isPublished;

  bool? _isDraft;
  bool? get isDraft => _$this._isDraft;
  set isDraft(bool? isDraft) => _$this._isDraft = isDraft;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ImageRecordBuilder() {
    ImageRecord._initializeBuilder(this);
  }

  ImageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageName = $v.imageName;
      _imageCategory = $v.imageCategory;
      _imagedescription = $v.imagedescription;
      _imageUplaodDate = $v.imageUplaodDate;
      _imageUserRefrence = $v.imageUserRefrence;
      _imageViewCount = $v.imageViewCount;
      _isFeatured = $v.isFeatured;
      _imagePath = $v.imagePath;
      _isAdson = $v.isAdson;
      _isPublished = $v.isPublished;
      _isDraft = $v.isDraft;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImageRecord;
  }

  @override
  void update(void Function(ImageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImageRecord build() => _build();

  _$ImageRecord _build() {
    final _$result = _$v ??
        new _$ImageRecord._(
            imageName: imageName,
            imageCategory: imageCategory,
            imagedescription: imagedescription,
            imageUplaodDate: imageUplaodDate,
            imageUserRefrence: imageUserRefrence,
            imageViewCount: imageViewCount,
            isFeatured: isFeatured,
            imagePath: imagePath,
            isAdson: isAdson,
            isPublished: isPublished,
            isDraft: isDraft,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
