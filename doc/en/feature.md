# Functionality

This package registers a package post-event module that runs when packages are installed, reinstalled, upgraded, or uninstalled. It helps container-based setups signal that the web server and the Znuny daemon should be restarted so configuration and code changes take effect.

The module ensures the directory `/persistent` exists and creates two empty marker files there:

1. `restart-httpd` — indicates that the web server should be restarted.
2. `restart-daemon` — indicates that the Znuny daemon should be restarted.

Your container entrypoint or orchestration layer can watch these files (or the directory) and perform the restarts, then remove or truncate the markers as appropriate.

The event module is registered in the system configuration under `Package::EventModulePost###1000-ContainerHelper`.
