// lib/data/models/product_card_model.dart
class ProductCardModel {
  final String id;
  final int brandId;
  final String name;
  final String nameEn;
  final String slug;
  final String sku;
  final String cardType;
  final num denominationValue;
  final String denominationCurrencyId;
  final String description;
  final String descriptionEn;
  final String terms;
  final String termsEn;
  final String expirationPolicy;
  final String expirationPolicyEn;
  final String instructions;
  final String instructionsEn;
  final int inStock;
  final bool isActive;
  final bool isFeatured;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final BrandSummary brand;
  final DenominationCurrency denominationCurrency;
  final num price;

  ProductCardModel({
    required this.id,
    required this.brandId,
    required this.name,
    required this.nameEn,
    required this.slug,
    required this.sku,
    required this.cardType,
    required this.denominationValue,
    required this.denominationCurrencyId,
    required this.description,
    required this.descriptionEn,
    required this.terms,
    required this.termsEn,
    required this.expirationPolicy,
    required this.expirationPolicyEn,
    required this.instructions,
    required this.instructionsEn,
    required this.inStock,
    required this.isActive,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.brand,
    required this.denominationCurrency,
    required this.price,
  });

  factory ProductCardModel.fromJson(Map<String, dynamic> json) => ProductCardModel(
        id: json['id'],
        brandId: json['brandId'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
        slug: json['slug'] ?? '',
        sku: json['sku'] ?? '',
        cardType: json['cardType'] ?? '',
        denominationValue: json['denominationValue'],
        denominationCurrencyId: json['denominationCurrencyId'],
        description: json['description'] ?? '',
        descriptionEn: json['descriptionEn'] ?? '',
        terms: json['terms'] ?? '',
        termsEn: json['termsEn'] ?? '',
        expirationPolicy: json['expirationPolicy'] ?? '',
        expirationPolicyEn: json['expirationPolicyEn'] ?? '',
        instructions: json['instructions'] ?? '',
        instructionsEn: json['instructionsEn'] ?? '',
        inStock: json['inStock'] ?? 0,
        isActive: json['isActive'] ?? false,
        isFeatured: json['isFeatured'] ?? false,
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        deletedAt: json['deletedAt'] != null ? DateTime.tryParse(json['deletedAt']) : null,
        brand: BrandSummary.fromJson(json['brand']),
        denominationCurrency: DenominationCurrency.fromJson(json['denominationCurrency']),
        price: json['price'],
      );
}

class BrandSummary {
  final int id;
  final String name;
  final String nameEn;
  final dynamic logoFile;
  final CategorySummary? category;
  final SubcategorySummary? subcategory;

  BrandSummary({
    required this.id,
    required this.name,
    required this.nameEn,
    this.logoFile,
    this.category,
    this.subcategory,
  });

  factory BrandSummary.fromJson(Map<String, dynamic> json) => BrandSummary(
        id: json['id'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
        logoFile: json['logoFile'],
        category: json['category'] != null ? CategorySummary.fromJson(json['category']) : null,
        subcategory: json['subcategory'] != null ? SubcategorySummary.fromJson(json['subcategory']) : null,
      );
}

class CategorySummary {
  final int id;
  final String name;
  final String nameEn;

  CategorySummary({
    required this.id,
    required this.name,
    required this.nameEn,
  });

  factory CategorySummary.fromJson(Map<String, dynamic> json) => CategorySummary(
        id: json['id'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
      );
}

class SubcategorySummary {
  final int id;
  final String name;
  final String nameEn;

  SubcategorySummary({
    required this.id,
    required this.name,
    required this.nameEn,
  });

  factory SubcategorySummary.fromJson(Map<String, dynamic> json) => SubcategorySummary(
        id: json['id'],
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
      );
}

class DenominationCurrency {
  final String id;
  final String code;
  final String symbol;
  final String name;
  final String nameEn;

  DenominationCurrency({
    required this.id,
    required this.code,
    required this.symbol,
    required this.name,
    required this.nameEn,
  });

  factory DenominationCurrency.fromJson(Map<String, dynamic> json) => DenominationCurrency(
        id: json['id'],
        code: json['code'] ?? '',
        symbol: json['symbol'] ?? '',
        name: json['name'] ?? '',
        nameEn: json['nameEn'] ?? '',
      );
}
