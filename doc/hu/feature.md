# Funkcionalitás

Ez a csomag egy csomagutóesemény-modult regisztrál, amely akkor fut, amikor csomagokat telepítenek, újratelepítenek, frissítenek vagy eltávolítanak. Segít a konténeralapú rendszereknek jelezni, hogy a webkiszolgálót és a Znuny démont újra kell indítani, hogy a beállítások és a kódváltoztatások hatályba lépjenek.

A modul biztosítja, hogy a `/persistent` könyvtár létezzen, és két üres jelölőfájlt hoz létre ott:

1. `restart-httpd` – azt jelzi, hogy a webkiszolgálót újra kell indítani.
2. `restart-daemon` – azt jelzi, hogy a Znuny démont újra kell indítani.

A konténer belépési pontja vagy az orchesztrációs réteg figyelheti ezeket a fájlokat (vagy a könyvtárat), és végrehajthatja az újraindításokat, majd szükség szerint eltávolíthatja vagy megcsonkíthatja a jelölőket.

Az eseménymodul a `Package::EventModulePost###1000-ContainerHelper` beállítás alatt van regisztrálva a rendszerbeállításokban.
