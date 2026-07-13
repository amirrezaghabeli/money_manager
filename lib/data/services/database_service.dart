import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/models/user.dart';

@LazySingleton()
class DataBaseService {
  static Database? _db;

  //users table and column name
  final String _usersTableName = 'users';
  final String _usersIdColumnName = 'id';
  final String _usersNameColumnName = 'name';
  final String _usersPasswordColumnName = 'password';

  //transactions table and column
  final String _transactionsTableName = 'transactions';
  final String _transactionsIdColumnName = 'id';
  final String _transactionsCategoryIdColumnName = 'categoryId';
  final String _transactionsUserIdColumnName = 'userId';
  final String _transactionsAmountColumnName = 'amount';
  final String _transactionsUnitColumnName = 'unit';
  final String _transactionsDateColumnName = 'date';
  final String _transactionsIsExpenseColumnName = 'isExpense';
  final String _transactionsCommentColumnName = 'comment';
  final String _transactionsPhotoColumnName = 'photo';

  //categories table and columns
  final String _categoriesTableName = 'categories';
  final String _categoriesIdColumnName = 'id';
  final String _categoriesUserIdColumnName = 'userId';
  final String _categoriesNameColumnName = 'name';
  final String _categoriesIconColumnName = 'icon';
  final String _categoriesColorColumnName = 'color';
  final String _categoriesisExpenseColumnName = 'isExpense';

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'master_db.db');
    final database = await openDatabase(
      databasePath,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        //users table
        await db.execute('''
          CREATE TABLE $_usersTableName (
            $_usersIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
            $_usersNameColumnName TEXT NOT NULL,
            $_usersPasswordColumnName TEXT NOT NULL
          )
          ''');

        //categories table
        await db.execute('''
        CREATE TABLE $_categoriesTableName (
          $_categoriesIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
          $_categoriesUserIdColumnName INTEGER NOT NULL,
          $_categoriesIconColumnName TEXT NOT NULL,
          $_categoriesColorColumnName TEXT NOT NULL,
          $_categoriesNameColumnName TEXT NOT NULL,
          $_categoriesisExpenseColumnName INTEGER NOT NULL,
          FOREIGN KEY ($_categoriesUserIdColumnName)
            REFERENCES $_usersTableName ($_usersIdColumnName)
            ON DELETE CASCADE
        )
        ''');

        //transactions table
        await db.execute('''
      CREATE TABLE $_transactionsTableName (
        $_transactionsIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
        $_transactionsCategoryIdColumnName INTEGER NOT Null,
        $_transactionsUserIdColumnName INTEGER NOT Null,
        $_transactionsAmountColumnName TEXT NOT NULL,
        $_transactionsUnitColumnName TEXT NOT NULL,
        $_transactionsDateColumnName TEXT NOT NULL,
        $_transactionsIsExpenseColumnName INTEGER NOT NULL,
        $_transactionsCommentColumnName TEXT NOT NULL,
        $_transactionsPhotoColumnName TEXT NOT NULL,
        FOREIGN KEY ($_transactionsCategoryIdColumnName)
          REFERENCES $_categoriesTableName ($_categoriesIdColumnName)
          ON DELETE SET NULL,
        FOREIGN KEY ($_transactionsUserIdColumnName)
          REFERENCES $_usersTableName ($_usersIdColumnName)
          ON DELETE CASCADE
      )
      ''');
      },
    );
    return database;
  }

  void addTransaction(
    String amount,
    String unit,
    bool isExpense,
    String comment,
    String date,
  ) async {
    final db = await database;
    await db.insert(_transactionsTableName, {
      _transactionsAmountColumnName: amount,
      _transactionsUnitColumnName: unit,
      _transactionsDateColumnName: date,
      _transactionsIsExpenseColumnName: isExpense ? 1 : 0,
      _transactionsCommentColumnName: comment,
    });
  }

  void addUser({required User user}) async {
    final db = await database;
    await db.insert(_usersTableName, {
      _usersNameColumnName: user.name,
      _usersPasswordColumnName: user.password,
    });
  }

  Future<User?> getUser({
    required String name,
    required String password,
  }) async {
    final db = await database;
    final result = await db.query(
      _usersTableName,
      where: '$_usersNameColumnName = ? AND $_usersPasswordColumnName = ?',
      whereArgs: [name, password],
      limit: 1,
    );
    if (result.isEmpty) {
      return null;
    }
    return User.fromJson(result.first);
  }
}
