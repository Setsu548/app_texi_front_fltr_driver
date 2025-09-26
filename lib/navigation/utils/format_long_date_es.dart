String formatLongDateEs(DateTime d) {
  const months = [
    'ene','feb','mar','abr','may','jun',
    'jul','ago','sep','oct','nov','dic'
  ];
  final m = months[d.month - 1];
  final cap = '${m[0].toUpperCase()}${m.substring(1)}'; 
  return '$cap ${d.year}';
}