bool isLoanOverdue({
  required DateTime? repaymentDate,
  required double remainingBalance,
}) {
  if (repaymentDate == null) return false;
  return repaymentDate.isBefore(DateTime.now()) && remainingBalance > 0;
}
