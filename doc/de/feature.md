# Funktionalität

Dieses Paket registriert ein Post-Event-Modul für Paketoperationen, das bei Installation, Neuinstallation, Upgrade und Deinstallation von Paketen ausgeführt wird. Es unterstützt containerbasierte Setups dabei, einen Neustart von Webserver und Znuny-Daemon anzustoßen, damit Konfigurations- und Codeänderungen wirksam werden.

Das Modul stellt sicher, dass das Verzeichnis `/persistent` existiert, und legt dort zwei leere Marker-Dateien an:

1. `restart-httpd` — signalisiert, dass der Webserver neu gestartet werden soll.
2. `restart-daemon` — signalisiert, dass der Znuny-Daemon neu gestartet werden soll.

Ihr Container-Entrypoint oder die Orchestrierung kann diese Dateien (oder das Verzeichnis) überwachen, die Neustarts ausführen und die Marker anschließend entfernen oder leeren.

Das Ereignismodul ist in der Systemkonfiguration unter `Package::EventModulePost###1000-ContainerHelper` registriert.
