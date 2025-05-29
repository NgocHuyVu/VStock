# 📦 VStock Backend

Backendová část aplikace **VStock** pro správu skladu. Postavena na frameworku **Django**, používá **PostgreSQL** jako databázi a je plně kontejnerizována pomocí **Dockeru**.

---

## 🚀 Hlavní funkce

- 🧾 REST API pro:
  - Správu produktů (`produkty`)
  - Správu skladů (`sklady`)
  - Evidenci zásob (`zásoby`)
  - Historii pohybů zboží (`pohyby zásob`)
- 🔒 Autentizace a správa uživatelů (Django Auth)
- 🛠️ Administrační rozhraní (Django Admin)
- 🗄️ Napojení na databázi PostgreSQL
- 🌐 Připraveno pro vývoj i produkční nasazení

---

## 🛠️ Použité technologie

- Python 3.8
- Django 4.x
- Django REST Framework
- PostgreSQL 14+
- Docker & Docker Compose
- .env konfigurační soubor pro bezpečné uložení přihlašovacích údajů

---

## 🧾 Struktura projektu


backend/
├── api/ # Vlastní aplikace s modely, view, serializers a URLs
│ ├── models.py
│ ├── views.py
│ ├── serializers.py
│ └── urls.py
├── backend/ # Nastavení Django projektu (settings.py, urls.py, wsgi.py)
├── Dockerfile # Definice Docker image
├── docker-compose.yml # Docker Compose konfigurace pro více kontejnerů
├── .env # Proměnné prostředí pro připojení k databázi
├── manage.py # Django CLI skript
└── README.md # Tento soubor


---

## ⚙️ Instalace a spuštění

> Požadavky: Docker a Docker Compose

python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
python manage.py makemigrations
python manage.py migrate
python manage.py runserver

docker exec -it backend-db-1 bash
psql -U vstockuser -d Ngoc_Hung_Vu
docker exec -it backend-db-1 psql -U vstockuser -d Ngoc_Hung_Vu
\dt
### 1. Vytvořte soubor `.env` s obsahem:

```env
POSTGRES_DB=vstock
POSTGRES_USER=postgres
POSTGRES_PASSWORD=yourpassword
POSTGRES_HOST=db
POSTGRES_PORT=5432

2. Spusťte celý projekt:
docker-compose up --build

3. Spusťte migrace (vytvoření databázových tabulek):
docker-compose run web python manage.py migrate

4. (Volitelné) Vytvořte administrátorský účet:
docker-compose run web python manage.py createsuperuser


| Metoda | Endpoint         | Popis                     |
| ------ | ---------------- | ------------------------- |
| GET    | `/api/produkty/` | Získání seznamu produktů  |
| POST   | `/api/produkty/` | Vytvoření nového produktu |
| GET    | `/api/sklady/`   | Získání seznamu skladů    |
| POST   | `/api/sklady/`   | Přidání nového skladu     |
| GET    | `/api/zasoby/`   | Přehled zásob ve skladech |
| POST   | `/api/zasoby/`   | Přidání zásoby do skladu  |
| POST   | `/api/pohyby/`   | Záznam pohybu zásoby      |


🧑‍💻 Vývoj
Pro interaktivní konzoli Django použijte:
docker-compose run web python manage.py shell
Pro přístup do administrace navštivte:
http://localhost:8000/admin

🔐 Autentizace
Backend používá výchozí Django autentizaci. Můžete rozšířit nebo upravit model uživatele dle potřeby.