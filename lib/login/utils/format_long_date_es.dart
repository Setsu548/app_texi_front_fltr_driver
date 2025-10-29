String formatLongDateEs(DateTime d) {
  const months = [
    'enero','febrero','marzo','abril','mayo','junio',
    'julio','agosto','septiembre','octubre','noviembre','diciembre'
  ];
  final m = months[d.month - 1];
  final cap = '${m[0].toUpperCase()}${m.substring(1)}'; 
  return '${d.day} de $cap, ${d.year}';
}

String formatShortDateEs(DateTime d) {
  final year = d.year.toString();
  final month = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}