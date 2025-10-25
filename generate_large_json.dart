import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  final now = DateTime.now();

  // Metadata
  final metadata = {
    'version': '2.0',
    'created': now.toIso8601String(),
    'description':
        'Massive scale database simulation with tens of thousands of records',
    'totalUsers': 5000,
    'totalProducts': 3000,
    'totalTransactions': 20000,
    'totalOrders': 15000,
    'totalInventoryLogs': 10000,
    'totalSuppliers': 500,
    'securityNote':
        'This dataset includes simulated security injection examples',
  };

  print('Generating users...');
  final users = generateUsers(random, now, 5000);

  print('Generating products...');
  final products = generateProducts(random, now, 3000);

  print('Generating transactions...');
  final transactions = generateTransactions(
    random,
    now,
    products,
    users,
    20000,
  );

  print('Generating orders...');
  final orders = generateOrders(random, now, users, products, 15000);

  print('Generating suppliers...');
  final suppliers = generateSuppliers(random, now, 500);

  print('Generating inventory logs...');
  final inventoryLogs = generateInventoryLogs(random, now, products, 10000);

  print('Generating analytics data...');
  final analytics = generateAnalytics(random, now);

  // Combine into main structure
  final database = {
    'metadata': metadata,
    'users': users,
    'products': products,
    'transactions': transactions,
    'orders': orders,
    'suppliers': suppliers,
    'inventoryLogs': inventoryLogs,
    'analytics': analytics,
  };

  // Write to file
  print('Writing to file...');
  final jsonString = jsonEncode(database);
  File('massive_database.json').writeAsStringSync(jsonString);

  final sizeInMB = (jsonString.length / 1024 / 1024).toStringAsFixed(2);
  print('Massive JSON database generated successfully!');
  print('File size: $sizeInMB MB');
  print(
    'Total records: ${users.length + products.length + transactions.length + orders.length + suppliers.length + inventoryLogs.length}',
  );
}

List<Map<String, dynamic>> generateUsers(
  Random random,
  DateTime now,
  int count,
) {
  final users = <Map<String, dynamic>>[];
  final firstNames = [
    'John',
    'Jane',
    'Alice',
    'Bob',
    'Charlie',
    'Diana',
    'Eve',
    'Frank',
    'Grace',
    'Henry',
    'Isabella',
    'Jack',
    'Katherine',
    'Liam',
    'Mia',
    'Noah',
    'Olivia',
    'Peter',
    'Quinn',
    'Rachel',
    'Samuel',
    'Taylor',
    'Uma',
    'Victor',
    'Wendy',
    'Xavier',
    'Yolanda',
    'Zachary',
    'Amy',
    'Benjamin',
    'Chloe',
    'Daniel',
    'Emma',
    'Felix',
    'Georgia',
    'Hugo',
  ];
  final lastNames = [
    'Doe',
    'Smith',
    'Johnson',
    'Williams',
    'Brown',
    'Jones',
    'Garcia',
    'Miller',
    'Davis',
    'Rodriguez',
    'Martinez',
    'Hernandez',
    'Lopez',
    'Gonzalez',
    'Wilson',
    'Anderson',
    'Thomas',
    'Taylor',
    'Moore',
    'Jackson',
    'Martin',
    'Lee',
    'Perez',
    'Thompson',
    'White',
    'Harris',
    'Sanchez',
  ];
  final cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
    'San Antonio',
    'San Diego',
    'Dallas',
    'San Jose',
    'Austin',
    'Jacksonville',
    'Fort Worth',
    'Columbus',
    'Charlotte',
    'San Francisco',
    'Indianapolis',
    'Seattle',
    'Denver',
    'Washington',
    'Boston',
    'Nashville',
    'Detroit',
  ];
  final countries = [
    'USA',
    'Canada',
    'UK',
    'Germany',
    'France',
    'Japan',
    'Australia',
    'Brazil',
    'India',
    'China',
    'Mexico',
    'Spain',
    'Italy',
    'Netherlands',
    'Sweden',
    'Norway',
    'Switzerland',
    'Singapore',
    'South Korea',
  ];
  final preferences = [
    'tech',
    'sports',
    'music',
    'travel',
    'food',
    'books',
    'movies',
    'gaming',
    'art',
    'fitness',
    'photography',
    'cooking',
    'gardening',
    'fashion',
    'science',
    'history',
    'crafts',
    'cars',
    'pets',
    'nature',
  ];
  final occupations = [
    'Engineer',
    'Teacher',
    'Doctor',
    'Designer',
    'Manager',
    'Developer',
    'Artist',
    'Writer',
    'Analyst',
    'Consultant',
    'Architect',
    'Scientist',
    'Accountant',
    'Lawyer',
    'Nurse',
    'Chef',
    'Photographer',
    'Entrepreneur',
  ];

  for (int i = 1; i <= count; i++) {
    final firstName = firstNames[random.nextInt(firstNames.length)];
    final lastName = lastNames[random.nextInt(lastNames.length)];
    final name = '$firstName $lastName';
    final email =
        '${firstName.toLowerCase()}.${lastName.toLowerCase()}${i}@example.com';
    final age = 18 + random.nextInt(63);
    final active = random.nextBool();
    final street =
        '${random.nextInt(9999) + 1} ${['Main', 'Oak', 'Pine', 'Elm', 'Maple', 'Cedar', 'Birch', 'Willow'][random.nextInt(8)]} St';
    final city = cities[random.nextInt(cities.length)];
    final country = countries[random.nextInt(countries.length)];
    final userPreferences = List.generate(
      random.nextInt(5) + 1,
      (_) => preferences[random.nextInt(preferences.length)],
    ).toSet().toList();
    final lastLogin = now
        .subtract(Duration(days: random.nextInt(365)))
        .toIso8601String();

    // Security injections
    String bio;
    if (i % 50 == 0) {
      bio = 'Bio with XSS: <script>alert("xss")</script>';
    } else if (i % 75 == 0) {
      bio = 'Bio with injection: javascript:void(0)';
    } else if (i % 100 == 0) {
      bio = 'Bio: <img src=x onerror=alert(1)>';
    } else {
      bio =
          'Regular user bio about ${preferences[random.nextInt(preferences.length)]}';
    }

    final purchaseHistory = List.generate(
      random.nextInt(20),
      (j) => {
        'orderId': random.nextInt(100000),
        'date': now
            .subtract(Duration(days: random.nextInt(730)))
            .toIso8601String(),
        'amount': (random.nextDouble() * 500 + 10).roundToDouble(),
      },
    );

    users.add({
      'id': i,
      'name': name,
      'email': email,
      'age': age,
      'active': active,
      'address': {
        'street': street,
        'city': city,
        'country': country,
        'zipCode': '${random.nextInt(90000) + 10000}',
        'coordinates': {
          'lat': (random.nextDouble() * 180 - 90).toStringAsFixed(6),
          'lng': (random.nextDouble() * 360 - 180).toStringAsFixed(6),
        },
      },
      'preferences': userPreferences,
      'lastLogin': lastLogin,
      'bio': bio,
      'phone':
          '+1-${random.nextInt(900) + 100}-${random.nextInt(9000) + 1000}-${random.nextInt(9000) + 1000}',
      'registrationDate': now
          .subtract(Duration(days: random.nextInt(365 * 3)))
          .toIso8601String(),
      'loyaltyPoints': random.nextInt(50000),
      'isPremium': random.nextBool(),
      'accountTier': [
        'Bronze',
        'Silver',
        'Gold',
        'Platinum',
      ][random.nextInt(4)],
      'occupation': occupations[random.nextInt(occupations.length)],
      'socialLinks': {
        'twitter': '@${firstName.toLowerCase()}${lastName.toLowerCase()}',
        'linkedin':
            'https://linkedin.com/in/${firstName.toLowerCase()}${lastName.toLowerCase()}',
        'instagram': '@${firstName.toLowerCase()}_${lastName.toLowerCase()}',
        'facebook':
            'https://facebook.com/${firstName.toLowerCase()}.${lastName.toLowerCase()}',
      },
      'purchaseHistory': purchaseHistory,
      'paymentMethods': List.generate(
        random.nextInt(3) + 1,
        (j) => {
          'type': [
            'Credit Card',
            'Debit Card',
            'PayPal',
            'Bank Account',
          ][random.nextInt(4)],
          'lastFour': '${random.nextInt(9000) + 1000}',
          'isDefault': j == 0,
        },
      ),
      'notifications': {
        'email': random.nextBool(),
        'sms': random.nextBool(),
        'push': random.nextBool(),
      },
      'privacySettings': {
        'profileVisible': random.nextBool(),
        'showEmail': random.nextBool(),
        'showPhone': random.nextBool(),
      },
    });

    if (i % 500 == 0) print('  Generated $i users...');
  }

  return users;
}

List<Map<String, dynamic>> generateProducts(
  Random random,
  DateTime now,
  int count,
) {
  final products = <Map<String, dynamic>>[];
  final productNames = [
    'Laptop',
    'Smartphone',
    'Tablet',
    'Headphones',
    'Keyboard',
    'Mouse',
    'Monitor',
    'Printer',
    'Router',
    'Smartwatch',
    'Camera',
    'Speaker',
    'Microphone',
    'Webcam',
    'Charger',
    'Cable',
    'Stand',
    'Case',
    'Bag',
    'Dock',
    'Hub',
    'Adapter',
    'Controller',
    'Console',
    'Drone',
  ];
  final categories = [
    'Electronics',
    'Computers',
    'Accessories',
    'Networking',
    'Wearables',
    'Audio',
    'Video',
    'Gaming',
    'Office',
    'Storage',
    'Photography',
  ];
  final descriptions = [
    'High-quality product with excellent features.',
    'Durable and reliable for everyday use.',
    'Advanced technology for modern needs.',
    'Compact design with powerful performance.',
    'User-friendly interface and long battery life.',
    'Professional-grade quality and precision.',
    'Innovative design with cutting-edge features.',
    'Ergonomic and comfortable for extended use.',
  ];
  final manufacturers = [
    'TechCorp',
    'GadgetInc',
    'ElectroLtd',
    'DeviceCo',
    'Innovate',
    'SmartTech',
    'ProGear',
    'UltraDevices',
    'MegaTech',
    'PrimeSystems',
  ];

  for (int i = 1; i <= count; i++) {
    final name =
        '${productNames[random.nextInt(productNames.length)]} Pro ${i}';
    final price = (random.nextDouble() * 3000 + 10).roundToDouble();
    final category = categories[random.nextInt(categories.length)];
    final inStock = random.nextBool();
    final stockQuantity = inStock ? random.nextInt(2000) + 1 : 0;
    final description = descriptions[random.nextInt(descriptions.length)];

    final reviews = <Map<String, dynamic>>[];
    final numReviews = random.nextInt(50);
    for (int j = 0; j < numReviews; j++) {
      final userId = random.nextInt(5000) + 1;
      final rating = random.nextInt(5) + 1;
      String comment;
      if (j % 10 == 0) {
        comment = 'SQL injection attempt: \' OR \'1\'=\'1';
      } else if (j % 15 == 0) {
        comment = 'XSS attempt: <script>alert("review")</script>';
      } else if (j % 20 == 0) {
        comment = 'Command injection: ; DROP TABLE reviews;--';
      } else {
        comment = [
          'Great product!',
          'Excellent quality',
          'Highly recommend',
          'Worth the price',
          'Amazing features',
        ][random.nextInt(5)];
      }

      reviews.add({
        'userId': userId,
        'rating': rating,
        'comment': comment,
        'date': now
            .subtract(Duration(days: random.nextInt(365)))
            .toIso8601String(),
        'helpful': random.nextInt(100),
        'verified': random.nextBool(),
      });
    }

    final tags = List.generate(
      random.nextInt(6) + 1,
      (_) => [
        'new',
        'bestseller',
        'discounted',
        'eco-friendly',
        'wireless',
        'premium',
        'limited',
        'trending',
      ][random.nextInt(8)],
    ).toSet().toList();

    final specifications = {
      'weight': '${(random.nextDouble() * 5 + 0.1).toStringAsFixed(2)} kg',
      'dimensions':
          '${random.nextInt(50) + 10}x${random.nextInt(50) + 10}x${random.nextInt(20) + 5} cm',
      'color': [
        'Black',
        'White',
        'Silver',
        'Blue',
        'Red',
        'Gold',
        'Gray',
        'Green',
      ][random.nextInt(8)],
      'material': [
        'Plastic',
        'Metal',
        'Aluminum',
        'Carbon Fiber',
        'Glass',
      ][random.nextInt(5)],
      'warranty': '${random.nextInt(5) + 1} years',
      'powerConsumption': '${random.nextInt(200) + 10}W',
      'connectivity': [
        'USB',
        'Bluetooth',
        'WiFi',
        'Ethernet',
        '5G',
      ][random.nextInt(5)],
    };

    products.add({
      'id': i,
      'sku': 'SKU-${random.nextInt(900000) + 100000}',
      'name': name,
      'price': price,
      'originalPrice': (price * (1 + random.nextDouble() * 0.3))
          .roundToDouble(),
      'category': category,
      'inStock': inStock,
      'stockQuantity': stockQuantity,
      'description': description,
      'reviews': reviews,
      'averageRating': reviews.isEmpty
          ? 0.0
          : (reviews.map((r) => r['rating'] as int).reduce((a, b) => a + b) /
                    reviews.length)
                .toStringAsFixed(1),
      'totalReviews': reviews.length,
      'tags': tags,
      'specifications': specifications,
      'releaseDate': now
          .subtract(Duration(days: random.nextInt(365 * 3)))
          .toIso8601String(),
      'warrantyYears': random.nextInt(5) + 1,
      'manufacturer': manufacturers[random.nextInt(manufacturers.length)],
      'manufacturerInfo': {
        'country': [
          'USA',
          'China',
          'Japan',
          'Germany',
          'South Korea',
        ][random.nextInt(5)],
        'website': 'https://manufacturer${random.nextInt(100)}.com',
      },
      'shipping': {
        'weight': '${(random.nextDouble() * 10 + 0.5).toStringAsFixed(2)} kg',
        'dimensions':
            '${random.nextInt(60) + 20}x${random.nextInt(60) + 20}x${random.nextInt(30) + 10} cm',
        'freeShipping': random.nextBool(),
        'estimatedDays': random.nextInt(10) + 1,
      },
      'variants': List.generate(
        random.nextInt(5) + 1,
        (j) => {
          'variantId': i * 100 + j,
          'color': ['Black', 'White', 'Blue', 'Red'][random.nextInt(4)],
          'size': ['Small', 'Medium', 'Large'][random.nextInt(3)],
          'price': (price + random.nextDouble() * 100).roundToDouble(),
          'stockQuantity': random.nextInt(100),
        },
      ),
      'relatedProducts': List.generate(
        random.nextInt(8) + 2,
        (_) => random.nextInt(3000) + 1,
      ),
      'images': List.generate(
        random.nextInt(6) + 3,
        (j) => 'https://images.example.com/product${i}_${j}.jpg',
      ),
    });

    if (i % 500 == 0) print('  Generated $i products...');
  }

  return products;
}

List<Map<String, dynamic>> generateTransactions(
  Random random,
  DateTime now,
  List<Map<String, dynamic>> products,
  List<Map<String, dynamic>> users,
  int count,
) {
  final transactions = <Map<String, dynamic>>[];
  final statuses = [
    'completed',
    'pending',
    'cancelled',
    'refunded',
    'processing',
    'shipped',
  ];

  for (int i = 1; i <= count; i++) {
    final userId = random.nextInt(users.length) + 1;
    final productId = random.nextInt(products.length) + 1;
    final quantity = random.nextInt(10) + 1;
    final unitPrice = products[productId - 1]['price'] as double;
    final total = (unitPrice * quantity).roundToDouble();
    final date = now
        .subtract(Duration(days: random.nextInt(365)))
        .toIso8601String();
    final status = statuses[random.nextInt(statuses.length)];
    final paymentMethod = [
      'Credit Card',
      'PayPal',
      'Bank Transfer',
      'Cash on Delivery',
      'Apple Pay',
      'Google Pay',
    ][random.nextInt(6)];
    final shippingAddress = users[userId - 1]['address'];

    String notes;
    if (i % 100 == 0) {
      notes = 'UNION SELECT * FROM users--';
    } else if (i % 150 == 0) {
      notes = '<script>document.cookie</script>';
    } else if (i % 200 == 0) {
      notes = '"; DROP TABLE transactions;--';
    } else {
      notes = 'Standard transaction';
    }

    transactions.add({
      'id': i,
      'transactionNumber': 'TXN-${random.nextInt(9000000) + 1000000}',
      'userId': userId,
      'productId': productId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'total': total,
      'date': date,
      'status': status,
      'paymentMethod': paymentMethod,
      'shippingAddress': shippingAddress,
      'billingAddress': random.nextBool()
          ? shippingAddress
          : users[random.nextInt(users.length)]['address'],
      'notes': notes,
      'taxAmount': (total * 0.08).roundToDouble(),
      'discountApplied': random.nextBool()
          ? (total * 0.15).roundToDouble()
          : 0.0,
      'shippingCost': (random.nextDouble() * 20 + 5).roundToDouble(),
      'trackingNumber': status == 'completed' || status == 'shipped'
          ? 'TN${random.nextInt(999999999) + 100000000}'
          : null,
      'estimatedDelivery': status == 'shipped' || status == 'processing'
          ? now.add(Duration(days: random.nextInt(10) + 1)).toIso8601String()
          : null,
      'currency': 'USD',
      'exchangeRate': 1.0,
      'refundAmount': status == 'refunded' ? total : 0.0,
      'refundDate': status == 'refunded'
          ? now.subtract(Duration(days: random.nextInt(30))).toIso8601String()
          : null,
    });

    if (i % 2000 == 0) print('  Generated $i transactions...');
  }

  return transactions;
}

List<Map<String, dynamic>> generateOrders(
  Random random,
  DateTime now,
  List<Map<String, dynamic>> users,
  List<Map<String, dynamic>> products,
  int count,
) {
  final orders = <Map<String, dynamic>>[];
  final statuses = [
    'placed',
    'confirmed',
    'processing',
    'shipped',
    'delivered',
    'cancelled',
  ];

  for (int i = 1; i <= count; i++) {
    final userId = random.nextInt(users.length) + 1;
    final numItems = random.nextInt(5) + 1;
    final items = <Map<String, dynamic>>[];
    double subtotal = 0;

    for (int j = 0; j < numItems; j++) {
      final productId = random.nextInt(products.length) + 1;
      final quantity = random.nextInt(5) + 1;
      final price = products[productId - 1]['price'] as double;
      final itemTotal = price * quantity;
      subtotal += itemTotal;

      items.add({
        'productId': productId,
        'productName': products[productId - 1]['name'],
        'quantity': quantity,
        'unitPrice': price,
        'total': itemTotal.roundToDouble(),
      });
    }

    final tax = (subtotal * 0.08).roundToDouble();
    final shipping = (random.nextDouble() * 25 + 5).roundToDouble();
    final discount = random.nextBool() ? (subtotal * 0.1).roundToDouble() : 0.0;
    final total = (subtotal + tax + shipping - discount).roundToDouble();

    orders.add({
      'id': i,
      'orderNumber': 'ORD-${random.nextInt(9000000) + 1000000}',
      'userId': userId,
      'items': items,
      'subtotal': subtotal.roundToDouble(),
      'tax': tax,
      'shippingCost': shipping,
      'discount': discount,
      'total': total,
      'status': statuses[random.nextInt(statuses.length)],
      'orderDate': now
          .subtract(Duration(days: random.nextInt(365)))
          .toIso8601String(),
      'shippingAddress': users[userId - 1]['address'],
      'paymentMethod': [
        'Credit Card',
        'PayPal',
        'Debit Card',
      ][random.nextInt(3)],
      'trackingInfo': {
        'carrier': ['FedEx', 'UPS', 'DHL', 'USPS'][random.nextInt(4)],
        'trackingNumber': 'TRK${random.nextInt(999999999) + 100000000}',
      },
    });

    if (i % 2000 == 0) print('  Generated $i orders...');
  }

  return orders;
}

List<Map<String, dynamic>> generateSuppliers(
  Random random,
  DateTime now,
  int count,
) {
  final suppliers = <Map<String, dynamic>>[];
  final companyTypes = ['LLC', 'Inc', 'Corp', 'Ltd', 'GmbH', 'SA'];
  final industries = [
    'Electronics',
    'Manufacturing',
    'Distribution',
    'Wholesale',
    'Import/Export',
  ];

  for (int i = 1; i <= count; i++) {
    suppliers.add({
      'id': i,
      'name':
          'Supplier ${['Tech', 'Global', 'Prime', 'Elite', 'Mega'][random.nextInt(5)]} ${companyTypes[random.nextInt(companyTypes.length)]}',
      'industry': industries[random.nextInt(industries.length)],
      'contactInfo': {
        'email': 'contact@supplier$i.com',
        'phone':
            '+1-${random.nextInt(900) + 100}-${random.nextInt(9000) + 1000}-${random.nextInt(9000) + 1000}',
        'website': 'https://supplier$i.com',
      },
      'address': {
        'street': '${random.nextInt(9999) + 1} Industrial Blvd',
        'city': [
          'Shanghai',
          'Hong Kong',
          'Singapore',
          'Tokyo',
          'Seoul',
        ][random.nextInt(5)],
        'country': [
          'China',
          'Hong Kong',
          'Singapore',
          'Japan',
          'South Korea',
        ][random.nextInt(5)],
      },
      'rating': (random.nextDouble() * 2 + 3).toStringAsFixed(1),
      'productsSupplied': List.generate(
        random.nextInt(20) + 5,
        (_) => random.nextInt(3000) + 1,
      ),
      'contractStart': now
          .subtract(Duration(days: random.nextInt(1095)))
          .toIso8601String(),
      'contractEnd': now
          .add(Duration(days: random.nextInt(730)))
          .toIso8601String(),
      'paymentTerms': [
        'Net 30',
        'Net 60',
        'Net 90',
        'Prepaid',
      ][random.nextInt(4)],
      'minimumOrder': (random.nextDouble() * 5000 + 1000).roundToDouble(),
    });
  }

  return suppliers;
}

List<Map<String, dynamic>> generateInventoryLogs(
  Random random,
  DateTime now,
  List<Map<String, dynamic>> products,
  int count,
) {
  final logs = <Map<String, dynamic>>[];
  final actions = [
    'restock',
    'sale',
    'return',
    'damage',
    'adjustment',
    'transfer',
  ];

  for (int i = 1; i <= count; i++) {
    final productId = random.nextInt(products.length) + 1;
    final action = actions[random.nextInt(actions.length)];
    final quantity = random.nextInt(100) + 1;

    logs.add({
      'id': i,
      'productId': productId,
      'action': action,
      'quantity': action == 'sale' || action == 'damage' ? -quantity : quantity,
      'timestamp': now
          .subtract(
            Duration(days: random.nextInt(365), hours: random.nextInt(24)),
          )
          .toIso8601String(),
      'location': 'Warehouse ${random.nextInt(10) + 1}',
      'performedBy': 'User${random.nextInt(100) + 1}',
      'notes': 'Inventory $action operation',
      'previousStock': random.nextInt(1000),
      'newStock': random.nextInt(1000),
    });

    if (i % 2000 == 0) print('  Generated $i inventory logs...');
  }

  return logs;
}

Map<String, dynamic> generateAnalytics(Random random, DateTime now) {
  return {
    'salesByMonth': List.generate(
      12,
      (i) => {
        'month': now
            .subtract(Duration(days: 30 * (11 - i)))
            .toIso8601String()
            .substring(0, 7),
        'revenue': (random.nextDouble() * 500000 + 100000).roundToDouble(),
        'orders': random.nextInt(5000) + 1000,
        'averageOrderValue': (random.nextDouble() * 200 + 50).roundToDouble(),
      },
    ),
    'topProducts': List.generate(
      20,
      (i) => {
        'productId': random.nextInt(3000) + 1,
        'unitsSold': random.nextInt(5000) + 100,
        'revenue': (random.nextDouble() * 100000 + 10000).roundToDouble(),
      },
    ),
    'customerSegments': {
      'premium': random.nextInt(500),
      'regular': random.nextInt(3000),
      'new': random.nextInt(1000),
      'inactive': random.nextInt(500),
    },
    'trafficSources': {
      'organic': random.nextInt(10000),
      'paid': random.nextInt(5000),
      'social': random.nextInt(3000),
      'direct': random.nextInt(7000),
      'referral': random.nextInt(2000),
    },
  };
}
