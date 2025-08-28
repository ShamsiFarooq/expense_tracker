
String formatDate(DateTime dt) {
  // Stub: simple yyyy-mm-dd
  return '${dt.year.toString().padLeft(4, '0')}-'
      '${dt.month.toString().padLeft(2, '0')}-'
      '${dt.day.toString().padLeft(2, '0')}';
}

String formatCurrency(num amount) {
  // Stub: simple prefix with $
  return '\$${amount.toStringAsFixed(2)}';
}
