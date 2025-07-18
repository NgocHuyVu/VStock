import os
from dotenv import load_dotenv

load_dotenv()

# === Debug a povolené hosty ===
DEBUG = True
ROOT_URLCONF = 'vstock_backend.urls'
ALLOWED_HOSTS = ['*']

CORS_ORIGIN_ALLOW_ALL = True

SECRET_KEY = os.environ.get("SECRET_KEY", "django-insecure-dev-key")
SECRET_API_HEADER = "X-API-Secret"
SECRET_API_KEY = os.environ.get("API_SECRET_KEY", "vas_tajny_klic!@#123")

DEFAULT_CHARSET = 'utf-8'

# === Aplikace ===
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'corsheaders',
    'rest_framework',
    'api',
]

# === Middleware ===
MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'api.middleware.APISecretMiddleware',  
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

# === Připojení k PostgreSQL ===
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get("POSTGRES_DB"),
        'USER': os.environ.get("POSTGRES_USER"),
        'PASSWORD': os.environ.get("POSTGRES_PASSWORD"),
        'HOST': os.environ.get("POSTGRES_HOST"),
        'PORT': os.environ.get("POSTGRES_PORT", 5432),
    }
}

print("POSTGRES_DB:", os.environ.get("POSTGRES_DB"))
print("USER:", os.environ.get("POSTGRES_USER"))
print("PASSWORD:", os.environ.get("POSTGRES_PASSWORD"))

# === Django Templates ===
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates', 
        'DIRS': [], 
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# === Nastavení REST API ===

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.AllowAny',
    ],
}


# === Statické a mediální soubory ===
STATIC_URL = '/static/'
MEDIA_URL = '/media/'

# === Výchozí typ primárního klíče ===
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

LANGUAGE_CODE = 'cs'

TIME_ZONE = 'Europe/Prague'

USE_I18N = True

USE_TZ = True
