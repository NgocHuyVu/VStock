from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    ProduktyViewSet, SkladyViewSet, PohybyZasobViewSet, ZasobyProduktuViewSet,
    ZemePuvoduViewSet, ZnackyVyrobceViewSet, KategorieViewSet, MenyViewSet, KurzyMenyViewSet
)

router = DefaultRouter()
router.register(r'zeme-puvodu', ZemePuvoduViewSet)
router.register(r'znacky-vyrobce', ZnackyVyrobceViewSet)
router.register(r'kategorie', KategorieViewSet)
router.register(r'meny', MenyViewSet)
router.register(r'kurzy-meny', KurzyMenyViewSet)
router.register(r'produkty', ProduktyViewSet)
router.register(r'sklady', SkladyViewSet)
router.register(r'pohyby-zasob', PohybyZasobViewSet)
router.register(r'zasoby', ZasobyProduktuViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
