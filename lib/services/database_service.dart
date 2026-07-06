import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static Database? _db;
  static final DataBaseService instance = DataBaseService._constructor();
  DataBaseService._constructor();

  //transactions table and column
  final String _transactionsTableName = 'transactions';
  final String _transactionsIdColumnName = 'id';
  final String _transactionsCategoryIdColumnName = 'categoryId';
  final String _transactionsAmountColumnName = 'amount';
  final String _transactionsUnitColumnName = 'unit';
  final String _transactionsDateColumnName = 'date';
  final String _transactionsIsExpenseColumnName = 'isExpense';
  final String _transactionsCommentColumnName = 'comment';
  final String _transactionsPhotoColumnName = 'photo';

  //categories table and columns
  final String _categoriesTableName = 'categories';
  final String _categoriesIdColumnName = 'id';
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
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        //categories table
        await db.execute('''
        CREATE TABLE $_categoriesTableName,
        $_categoriesIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT
        $_categoriesIconColumnName TEXT NOT NULL
        $_categoriesColorColumnName TEXT NOT NULL
        $_categoriesNameColumnName TEXT NOT NULL
        $_categoriesisExpenseColumnName INTEGER NOT NULL
        ''');

        //transactions table
        await db.execute('''
      CREATE TABLE $_transactionsTableName (
         $_transactionsIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
         $_transactionsAmountColumnName TEXT NOT NULL,
         $_transactionsUnitColumnName TEXT NOT NULL,
         $_transactionsDateColumnName TEXT NOT NULL,
         $_transactionsIsExpenseColumnName INTEGER NOT NULL,
         $_transactionsCommentColumnName TEXT NOT NULL,
         $_transactionsPhotoColumnName TEXT NOT NULL,
         FOREIGN KEY ($_transactionsCategoryIdColumnName)
           REFRENCES $_categoriesTableName ($_categoriesIdColumnName)
           ON DELETE SET NULL
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
}
