import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla_desktop/screens/loan_payments_screen.dart';
import '../screens/create_account_screen.dart';
import '../screens/accounts_list_screen.dart';
import '../screens/loans_screen.dart';
import '../screens/savings_screen.dart';
import '../screens/welfare_screen.dart';
import '../screens/penalties_screen.dart';
import '../screens/summary_screen.dart';
import '../screens/group_summary_screen.dart';
import '../screens/statements_screen.dart';
import '../screens/share_out_screen.dart';
import '../screens/login_screen.dart';
import '../../main.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _resetInactivityTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _inactivityTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _logout();
    }
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(minutes: 3), _logout);
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', false);

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(prefillUsername: ''),
        ),
        (route) => false,
      );
    }
  }

  void _navigate(VoidCallback nav) {
    _resetInactivityTimer();
    nav();
  }

  void _navigateToCreateAccount() => _navigate(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateAccountScreen()),
    );
  });

  void _navigateToAccountList() => _navigate(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AccountsListScreen()),
    );
  });

  void _navigateToSummary() => _navigate(() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SummaryScreen()));
  });

  void _navigateToGroupSummary() => _navigate(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => GroupSummaryScreen()),
    );
  });

  void _navigateToStatements() => _navigate(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => StatementsScreen()),
    );
  });

  void _navigateToShareOut() => _navigate(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShareOutScreen()),
    );
  });

  void _navigateToLoansList() => _navigate(() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoansScreen()));
  });

  void _navigateToLoanPayments() => _navigate(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LoanPaymentsScreen()),
    );
  });

  void _navigateToSavingsList() => _navigate(() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SavingsScreen()));
  });

  void _navigateToWelfare() => _navigate(() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => WelfareScreen()));
  });

  void _navigateToPenalties() => _navigate(() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PenaltiesScreen()),
    );
  });

  Widget _buildSectionItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        _resetInactivityTimer();
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: _resetInactivityTimer,
      onPanDown: (_) => _resetInactivityTimer(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Village Savings and Loans Association",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.lock_outline),
              tooltip: 'Lock App',
              onPressed: _logout,
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: _navigateToCreateAccount,
                      icon: const Icon(Icons.person_add_alt_1_outlined),
                      label: const Text("Create New Account"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                        ),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 32),
                    OutlinedButton.icon(
                      onPressed: _navigateToAccountList,
                      icon: const Icon(Icons.account_circle_outlined),
                      label: const Text("Accounts"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                        ),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: _navigateToSummary,
                      icon: const Icon(Icons.assignment_ind_outlined),
                      label: const Text("Individual Summary"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                        ),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: _navigateToGroupSummary,
                      icon: const Icon(Icons.group_outlined),
                      label: const Text("Group Summary"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                        ),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: _navigateToStatements,
                      icon: const Icon(Icons.receipt_long_outlined),
                      label: const Text("Statements"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                        ),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: _navigateToShareOut,
                      icon: const Icon(Icons.pie_chart_outline),
                      label: const Text("Share Out"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4),
                        ),
                        textStyle: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionItem(title: "Loans", onTap: _navigateToLoansList),
              _buildSectionItem(
                title: "Loan Payments",
                onTap: _navigateToLoanPayments,
              ),
              _buildSectionItem(
                title: "Savings",
                onTap: _navigateToSavingsList,
              ),
              _buildSectionItem(title: "Welfare", onTap: _navigateToWelfare),
              _buildSectionItem(
                title: "Penalties",
                onTap: _navigateToPenalties,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
