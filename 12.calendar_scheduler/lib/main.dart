import "package:flutter/material.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:get_it/get_it.dart";
import "package:provider/provider.dart";
import "package:firebase_core/firevase_core.dart";

import "package:calendar_scheduler/screen/home_screen.dart";
import "package:calendar_scheduler/database/drift_database.dart";
import "package:calendar_scheduler/provider/schedule_provider.dart";
import "package:calendar_schdeuler/repository/schedule_repository.dart";
import "package:calendar_scheduler/firebase_options.dart";


void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options : DefaultFirebaseOptions.currentPlatform,
    );
    
    await initializeDateFormatting();

    // final database = LocalDatabase();

    // GetIt.I.registerSingleton<LocalDatabase> (database);

    // final repository = ScheduleRepository();
    // final scheduleProvider = ScheduleProvider(repository : repository);
    
    // runApp(
    //     ChangeNotifier(
    //         create : (_) => scheduleProvider,
    //         child : MaterialApp(
    //             home : HomeScreen(),
    //         ),
    //     ),
    // );

    runApp(
        MaterialApp(
            debugShowCheckedModeBanner : false,
            home : HomeScreen(),
        ),
    );
}