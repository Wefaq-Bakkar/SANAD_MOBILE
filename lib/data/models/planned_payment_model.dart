class PlannedPayment {
  final String? title;
  final String? subtitle;
  final DateTime? date;
  final double? amount;
  final String? iconSvg; 
  final String? recurrenceDescription;
  final String? accountName;

  PlannedPayment({
    this.title,
    this.subtitle,
    this.date,
    this.amount,
    this.iconSvg,
    this.recurrenceDescription,
    this.accountName,
  });
}