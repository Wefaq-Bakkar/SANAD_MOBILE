// lib/data/models/category_model.dart

class CategoryModel {
  final int id;
  final String name;
  final String nameEn;
  final String? fileImageid;
  final CategoryFileImage? fileImage;
  final String slug;
  final int sortOrder;
  final int subcategoriesTotal;
  final int brandsTotal;
  final List<SubcategoryModel> subcategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.nameEn,
    this.fileImageid,
    this.fileImage,
    required this.slug,
    required this.sortOrder,
    required this.subcategoriesTotal,
    required this.brandsTotal,
    required this.subcategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
        fileImageid: json['fileImageid']?.toString(),
        fileImage: json['fileImage'] != null ? CategoryFileImage.fromJson(json['fileImage']) : null,
        slug: json['slug'] ?? '',
        sortOrder: json['sortOrder'] ?? 0,
        subcategoriesTotal: json['subcategoriesTotal'] ?? 0,
        brandsTotal: json['brandsTotal'] ?? 0,
        subcategories: (json['subcategories'] as List? ?? [])
            .map((e) => SubcategoryModel.fromJson(e))
            .toList(),
      );
}

class CategoryFileImage {
  final String id;
  final String path;
  final int size;

  CategoryFileImage({
    required this.id,
    required this.path,
    required this.size,
  });

  factory CategoryFileImage.fromJson(Map<String, dynamic> json) => CategoryFileImage(
        id: json['id'] ?? '',
        path: json['path'] ?? '',
        size: json['size'] ?? 0,
      );
}

class SubcategoryModel {
  final int id;
  final String name;
  final String nameEn;
  final String slug;
  final String? imageFileId;
  final String? imageFile;
  final int sortOrder;
  final int brandsTotal;

  SubcategoryModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.slug,
    this.imageFileId,
    this.imageFile,
    required this.sortOrder,
    required this.brandsTotal,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) => SubcategoryModel(
        id: json['id'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
        slug: json['slug'] ?? '',
        imageFileId: json['imageFileId']?.toString(),
        imageFile: json['imageFile']?.toString(),
        sortOrder: json['sortOrder'] ?? 0,
        brandsTotal: json['brandsTotal'] ?? 0,
      );
}
