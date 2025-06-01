import '../../models/budget_model.dart';

final Map<String, List<Budget>> budgetsByPeriod = {
  'Weekly': [
    Budget(
      title: 'Entertainment',
      amount: 40.00,
      percentage: 0.5,
      status: 'active',
      spent: 20.00,
      remain: 20.00,
    ),
    Budget(
      title: 'Entertainment',
      amount: 40.00,
      percentage: 0.5,
      status: 'active',
      spent: 20.00,
      remain: 20.00,
    ),
    Budget(
      title: 'Shopping',
      amount: 30.00,
      percentage: 1.0,
      status: 'closed',
      spent: 30.00,
      remain: 0.00,
    ),
  ],
  'Monthly': [
    Budget(
      title: 'Groceries',
      amount: 170.00,
      percentage: 1.0,
      status: 'closed',
      spent: 170.00,
      remain: 0.00,
    ),
    Budget(
      title: 'Life Entertainment',
      amount: 60.00,
      percentage: 0.5,
      status: 'active',
      spent: 30.00,
      remain: 30.00,
    ),
  ],
  'Yearly': [
    Budget(
      title: 'Vehicle',
      amount: 50.00,
      percentage: 0.5,
      status: 'active',
      spent: 25.00,
      remain: 25.00,
    ),
  ],
  'One-Time': [
    Budget(
      title: 'Event',
      amount: 30.00,
      percentage: 0.5,
      status: 'active',
      spent: 15.00,
      remain: 15.00,
    ),
  ],
};