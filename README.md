# 📦 VStock - Systém pro správu skladu

**VStock** je mobilní aplikace pro Android určená pro řízení skladového hospodářství. Umožňuje evidenci produktů, sledování zásob a pohybů zboží mezi sklady.  
Frontend je vyvinut pomocí **Flutteru** a backend běží v **Dockeru** s využitím **Django REST Frameworku**.

## 🌟 Hlavní funkce
- Správa produktů a kategorií
- Sledování zásob v reálném čase
- Podpora více skladů
- Historie pohybů zboží
---

## ⚙️ Požadavky na systém

Před spuštěním aplikace je nutné nainstalovat:

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

### 3. Spuštění Flutter aplikaci (frontend)
Ve druhém terminálu spusťte mobilní aplikaci:
```bash
cd VStock
flutter pub get
flutter run
```
### 🧪 Testování a vývoj
API testování: můžete využít Postman nebo rozhraní http://localhost:8000/api/

Flutter hot reload: změny v kódu se okamžitě projeví pomocí flutter run + klávesa r

Logování backendu: výstup je dostupný v terminálu, nebo v souboru cron.log (např. při načítání kurzů měn)



## ⚙️ Instalace na server s Ubuntu

Pokud chcete aplikaci provozovat na vlastním serveru s Ubuntu, postupujte podle následujících kroků:

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

Přidání této řádku:
```bash
0 15 * * * cd /home/xrdpuser/Vstock_backend-main && /home/xrdpuser/Vstock_backend-main/venv/bin/python manage.py fetch_eur_czk >> /home/xrdpuser/Vstock_backend-main/fetch_eur_czk.log 2>&1
```

### 4. Spuštění
```bash
python manage.py runserver 0.0.0.0:8000
```
### ⚠️ Důležité upozornění
Pokud používáte aplikaci také na straně Flutteru, nezapomeňte změnit URL API v souboru VSTOCK/lib/services/apiservice.dart tak, aby odkazovala na správnou adresu vašeho backendu.

