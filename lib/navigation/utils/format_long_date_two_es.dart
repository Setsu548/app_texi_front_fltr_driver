String formatLongDateTwoEs(DateTime d) {
  const months = [
    'enero','febrero','marzo','abril','mayo','junio',
    'julio','agosto','septiembre','octubre','noviembre','diciembre'
  ];
  final m = months[d.month - 1];
  final cap = '${m[0].toUpperCase()}${m.substring(1)}'; 
  return '${d.day} $cap ${d.year}';
}