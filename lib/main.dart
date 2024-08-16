import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/tashi.jpg'),
      ),
    );
  }
}


class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          width: 350, // Adjust width as needed
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo at the top
              Image.asset(
                'assets/logo(2).jpg', // Ensure the path is correct
                height: 100, // Adjust height as needed
              ),
              SizedBox(height: 20), // Space between logo and input fields
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            Image.asset('assets/logo(2).jpg', height: 40), // Adjust height as needed
            SizedBox(width: 8), // Space between logo and text
            Text('Tashi Bank'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Row(
                children: [
                  Image.asset('assets/logo(2).jpg', height: 40), // Adjust height as needed
                  SizedBox(width: 8), // Space between logo and text
                  Text(
                    'Tashi Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Accounts'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/photo3.jpg'),
            SizedBox(height: 20),
            Text(
              'Welcome to Tashi Bank!',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              'From everyday banking to credit cards, find ways to save money and make real financial progress.',
              style: TextStyle(fontSize: 16),
            ),
            
          ],
        ),
      ),
    );
  }
}

class AccountsPage extends StatelessWidget {
  final Map<String, dynamic> chequingAccount = {
    "accountNumber": "001234567890",
    "balance": 1250.75,
    "currency": "USD"
  };

  final Map<String, dynamic> savingsAccount = {
    "accountNumber": "009876543210",
    "balance": 4890.5,
    "currency": "USD"
  };

  final List<Map<String, dynamic>> chequingTransactions = [
    {"date": "2024-08-01", "description": "Grocery Store", "amount": -45.67},
    {"date": "2024-08-02", "description": "Salary", "amount": 1500},
    {"date": "2024-08-03", "description": "Coffee Shop", "amount": -3.25},
    {"date": "2024-08-04", "description": "Electricity Bill", "amount": -120},
    {"date": "2024-08-05", "description": "Transfer to Savings", "amount": -300},
    {"date": "2024-08-06", "description": "Restaurant", "amount": -75.5},
    {"date": "2024-08-07", "description": "Gas Station", "amount": -40},
    {"date": "2024-08-08", "description": "Internet Bill", "amount": -60},
    {"date": "2024-08-09", "description": "Movie Tickets", "amount": -25},
    {"date": "2024-08-10", "description": "Gym Membership", "amount": -50},
  ];

  final List<Map<String, dynamic>> savingsTransactions = [
    {"date": "2024-08-01", "description": "Interest Earned", "amount": 5.25},
    {"date": "2024-08-02", "description": "Transfer from Chequing", "amount": 300},
    {"date": "2024-08-03", "description": "Deposit", "amount": 100},
    {"date": "2024-08-04", "description": "Transfer from Chequing", "amount": 200},
    {"date": "2024-08-05", "description": "Interest Earned", "amount": 4.75},
    {"date": "2024-08-06", "description": "Deposit", "amount": 150},
    {"date": "2024-08-07", "description": "Transfer from Chequing", "amount": 250},
    {"date": "2024-08-08", "description": "Interest Earned", "amount": 3.5},
    {"date": "2024-08-09", "description": "Deposit", "amount": 200},
    {"date": "2024-08-10", "description": "Transfer from Chequing", "amount": 400},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            Image.asset('assets/logo(2).jpg', height: 40), // Adjust height as needed
            SizedBox(width: 8), // Space between logo and text
            Text('Tashi Bank'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Row(
                children: [
                  Image.asset('assets/logo(2).jpg', height: 40), // Adjust height as needed
                  SizedBox(width: 8), // Space between logo and text
                  Text(
                    'Tashi Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Accounts'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Accounts',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionPage(
                      accountName: 'Chequing',
                      transactions: chequingTransactions,
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.teal,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chequing',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Account Number: ${chequingAccount["accountNumber"]}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Balance: \$${chequingAccount["balance"]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionPage(
                      accountName: 'Savings',
                      transactions: savingsTransactions,
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.teal,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Savings',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Account Number: ${savingsAccount["accountNumber"]}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Balance: \$${savingsAccount["balance"]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  final String accountName;
  final List<Map<String, dynamic>> transactions;

  TransactionPage({required this.accountName, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('$accountName Transactions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: transactions.isEmpty
            ? Center(child: Text('No transactions available'))
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return ListTile(
                    title: Text(transaction['description']),
                    subtitle: Text(transaction['date']),
                    trailing: Text(
                      '${transaction['amount'].toStringAsFixed(2)} USD',
                      style: TextStyle(
                        color: transaction['amount'] < 0 ? Colors.red : Colors.green,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
