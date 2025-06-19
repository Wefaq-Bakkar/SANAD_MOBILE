// lib/data/models/subcategory_model.dart
class SubcategoryModel {
  final int id;
  final String name;
  final String nameEn;
  final String? imageFileId;
  final SubcategoryFileImage? imageFile;
  final String slug;
  final int categoryId;
  final int sortOrder;
  final int brandsTotal;

  SubcategoryModel({
    required this.id,
    required this.name,
    required this.nameEn,
    this.imageFileId,
    this.imageFile,
    required this.slug,
    required this.categoryId,
    required this.sortOrder,
    required this.brandsTotal,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) => SubcategoryModel(
        id: json['id'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
        imageFileId: json['imageFileId']?.toString(),
        imageFile: json['imageFile'] != null ? SubcategoryFileImage.fromJson(json['imageFile']) : null,
        slug: json['slug'] ?? '',
        categoryId: json['categoryId'],
        sortOrder: json['sortOrder'] ?? 0,
        brandsTotal: json['brandsTotal'] ?? 0,
      );
}

class SubcategoryFileImage {
  final String id;
  final String path;
  final int size;

  SubcategoryFileImage({
    required this.id,
    required this.path,
    required this.size,
  });

  factory SubcategoryFileImage.fromJson(Map<String, dynamic> json) => SubcategoryFileImage(
        id: json['id'] ?? '',
        path: json['path'] ?? '',
        size: json['size'] ?? 0,
      );
}
