// lib/data/models/brand_model.dart
class BrandModel {
  final int id;
  final String name;
  final String nameEn;
  final String slug;
  final String? logoFileId;
  final int categoryId;
  final int? subcategoryId;
  final int detailTemplateId;
  final String description;
  final String descriptionEn;
  final String websiteUrl;
  final bool featured;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final BrandLogoFile? logoFile;

  BrandModel({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.slug,
    this.logoFileId,
    required this.categoryId,
    this.subcategoryId,
    required this.detailTemplateId,
    required this.description,
    required this.descriptionEn,
    required this.websiteUrl,
    required this.featured,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.logoFile,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json['id'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
        slug: json['slug'] ?? '',
        logoFileId: json['logoFileId']?.toString(),
        categoryId: json['categoryId'],
        subcategoryId: json['subcategoryId'],
        detailTemplateId: json['detailTemplateId'],
        description: json['description'] ?? '',
        descriptionEn: json['descriptionEn'] ?? '',
        websiteUrl: json['websiteUrl'] ?? '',
        featured: json['featured'] ?? false,
        isActive: json['isActive'] ?? false,
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        deletedAt: json['deletedAt'] != null ? DateTime.tryParse(json['deletedAt']) : null,
        logoFile: json['logoFile'] != null ? BrandLogoFile.fromJson(json['logoFile']) : null,
      );
}

class BrandLogoFile {
  final String id;
  final String path;
  final int size;

  BrandLogoFile({
    required this.id,
    required this.path,
    required this.size,
  });

  factory BrandLogoFile.fromJson(Map<String, dynamic> json) => BrandLogoFile(
        id: json['id'] ?? '',
        path: json['path'] ?? '',
        size: json['size'] ?? 0,
      );
}
