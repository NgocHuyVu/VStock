# 📦 VStock - Systém pro správu skladu

**VStock** je mobilní aplikace pro Android, určená pro řízení skladového hospodářství. Umožňuje evidenci produktů, sledování zásob a pohybů zboží mezi sklady.  
Frontend je vyvinut pomocí **Flutteru** a backend běží v **Dockeru** s využitím **Django REST Frameworku**.

## 🌟 Hlavní funkce
- Správa produktů a kategorií
- Sledování zásob v reálném čase
- Podpora více skladů
- Historie pohybů zboží
---

## 🔒 Bezpečnostní opatření

Systém VStock implementuje **povinný API klíč** pro ochranu proti neoprávněnému přístupu i v případě, že je IP adresa serveru známa. Bez platného klíče nelze data číst ani upravovat.

Pro změnu bezpečnostního klíče postupujte následovně:

### 1. V backendu (Django)
Soubor: `backend/vstock_backend/settings.py`:

```python
SECRET_API_KEY = "váš_nový_velmi_složitý_klíč_zde_123!@#$%^&*"
```

### 2. V mobilní aplikaci (Flutter):
Soubor: lib/services/api_service.dart

```dart
final Map<String, String> _headers = {
  'Content-Type': 'application/json',
  'X-API-Secret': 'váš_nový_velmi_složitý_klíč_zde_123!@#$%^&*',
};
```

## ⚙️ Požadavky na systém

Před spuštěním aplikace je potřeba mít nainstalováno:

- [Flutter](https://flutter.dev/docs/get-started/install) (doporučeno v3.0+)
- [Docker](https://www.docker.com/) (v20.10+)
- [Docker Compose](https://docs.docker.com/compose/) (v2.0+)
- Android SDK (pro testování aplikace)
- Python 3.8+ (pro vývoj backendu)

> 💡 Pro spuštění Flutter aplikace je potřeba Android emulátor nebo připojené fyzické zařízení.

---

## 🚀 Instalace a spuštění

### 1. Naklonování repozitáře
```bash
git clone https://github.com/NgocHuyVu/VStock.git
```
### 2. Spuštění backend (Django) pomocí Docker Compose 
```bash
cd backend
docker compose up 
```
Tímto příkazem se spustí backendový server na adrese:
```bash
http://localhost:8000
```

### 3. Spuštění Flutter aplikace (frontend)
```bash
cd VStock
flutter pub get
flutter run
```

## ⚙️ Instalace na vlastním serveru s Ubuntu


### 1. Vytvoření a aktivace virtuálního prostředí Pythonu

```bash
python3 -m venv venv
source venv/bin/activate
```

### 2. Instalace potřebných balíčků
```bash
pip install -r requirements.txt
```

### 3. Nastavení automatického spouštění příkazu každý den v 15:00
```bash
sudo timedatectl set-timezone Europe/Prague
crontab -e
```

Přidání tohoto řádku:
```bash
0 15 * * * cd /home/xrdpuser/Vstock_backend-main && /home/xrdpuser/Vstock_backend-main/venv/bin/python manage.py fetch_eur_czk >> /home/xrdpuser/Vstock_backend-main/fetch_eur_czk.log 2>&1
```

### 4. Spuštění
```bash
python manage.py runserver 0.0.0.0:8000
```
### ⚠️ Důležité upozornění
Nezapomeňte změnit URL API v souboru VSTOCK/lib/services/apiservice.dart tak, aby odkazovala na správnou adresu vašeho backendu.

Soubor: lib/services/api_service.dart

```dart
final String baseUrl = 'http://vaše_adresa/api';
```
