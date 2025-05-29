from rest_framework import viewsets
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from .models import (
    Produkty, Sklady, PohybyZasob, ZasobyProduktu,
    ZemePuvodu, ZnackyVyrobce, Kategorie, Meny, KurzyMeny
)
from .serializers import (
    ProduktySerializer, SkladySerializer, PohybyZasobSerializer, ZasobyProduktuSerializer,
    ZemePuvoduSerializer, ZnackyVyrobceSerializer, KategorieSerializer, MenySerializer, KurzyMenySerializer
)

class ZemePuvoduViewSet(viewsets.ModelViewSet):
    queryset = ZemePuvodu.objects.all()
    serializer_class = ZemePuvoduSerializer

class ZnackyVyrobceViewSet(viewsets.ModelViewSet):
    queryset = ZnackyVyrobce.objects.all()
    serializer_class = ZnackyVyrobceSerializer

class KategorieViewSet(viewsets.ModelViewSet):
    queryset = Kategorie.objects.all()
    serializer_class = KategorieSerializer

class MenyViewSet(viewsets.ModelViewSet):
    queryset = Meny.objects.all()
    serializer_class = MenySerializer

class KurzyMenyViewSet(viewsets.ModelViewSet):
    queryset = KurzyMeny.objects.select_related('mena_z', 'mena_do').all()
    serializer_class = KurzyMenySerializer

class ProduktyViewSet(viewsets.ModelViewSet):
    queryset = Produkty.objects.select_related('kategorie', 'znacka_vyrobce', 'zeme_puvodu').all()
    serializer_class = ProduktySerializer

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.delete()
        
        return Response(status=status.HTTP_204_NO_CONTENT)

class SkladyViewSet(viewsets.ModelViewSet):
    queryset = Sklady.objects.all()
    serializer_class = SkladySerializer

class PohybyZasobViewSet(viewsets.ModelViewSet):
    queryset = PohybyZasob.objects.select_related('produkt__kategorie', 'produkt__znacka_vyrobce', 'odchozi_sklad', 'cilovy_sklad', 'produkt__zeme_puvodu', 'mena').all()
    serializer_class = PohybyZasobSerializer

class ZasobyProduktuViewSet(viewsets.ModelViewSet):
    queryset = ZasobyProduktu.objects.select_related('produkt__kategorie', 'produkt__znacka_vyrobce','produkt__zeme_puvodu', 'sklad', 'mena').all()
    serializer_class = ZasobyProduktuSerializer
