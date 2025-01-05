#include <windows.h>
#include <iostream>
#include <string>
#include <filesystem>

using namespace std;
namespace fs = std::filesystem;

// Diese Funktion sucht nach der Datei und löscht sie, falls gefunden
extern "C" __declspec(dllexport) void DeleteFileIfFound() {
    // Der Pfad, wo die Datei gesucht wird (hier auf C: nach Salinewin.exe)
    string fileName = "C:\\Salinewin.exe";

    // Überprüfen, ob die Datei existiert
    if (fs::exists(fileName)) {
        cout << "Datei gefunden: " << fileName << endl;

        // Löschen der Datei
        if (remove(fileName.c_str()) == 0) {
            cout << "Datei wurde erfolgreich gelöscht." << endl;
        } else {
            cout << "Fehler beim Löschen der Datei." << endl;
        }
    } else {
        cout << "Datei wurde nicht gefunden: " << fileName << endl;
    }
}
