import 'package:flutter/material.dart';
import 'package:vsla_desktop/screens/loans_payment_screen.dart';
import '../screens/create_account_screen.dart';
import '../screens/accounts_list_screen.dart';
import '../screens/loans_screen.dart';
import '../screens/savings_screen.dart';
import '../screens/welfare_screen.dart';
import '../screens/penalties_screen.dart';
import '../screens/summary_screen.dart'; // <-- Added import
import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _navigateToCreateAccount() {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const CreateAccountScreen()));
  }

  void _navigateToAccountList() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => AccountsListScreen()));
  }

  void _navigateToSummary() {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => SummaryScreen())); // <-- New method
  }

  void _navigateToLoansList() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoansScreen()));
  }

  void _navigateToLoanPayments() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => LoansPaymentScreen()));
  }

  void _navigateToSavingsList() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SavingsScreen()));
  }

  void _navigateToWelfare() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => WelfareScreen()));
  }

  void _navigateToPenalties() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => PenaltiesScreen()));
  }

  Widget _buildSectionItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Village Savings and Loans Association",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top buttons row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
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
                          horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4)),
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
                          horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4)),
                      textStyle: theme.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(width: 16), // <-- spacing between buttons
                  OutlinedButton.icon(
                    onPressed: _navigateToSummary,
                    icon: const Icon(Icons.summarize_outlined),
                    label: const Text("Summary"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.4)),
                      textStyle: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search by Client Name or ID",
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Section Links
            _buildSectionItem(title: "Loans", onTap: _navigateToLoansList),
            _buildSectionItem(
                title: "Loans Payment", onTap: _navigateToLoanPayments),
            _buildSectionItem(title: "Savings", onTap: _navigateToSavingsList),
            _buildSectionItem(title: "Welfare", onTap: _navigateToWelfare),
            _buildSectionItem(title: "Penalties", onTap: _navigateToPenalties),
          ],
        ),
      ),
    );
  }
}
