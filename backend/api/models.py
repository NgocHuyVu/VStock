from django.db import models

class ZemePuvodu(models.Model):
    nazev = models.CharField(max_length=255, unique=True)

    class Meta:
        db_table = 'zeme_puvodu'
        managed = False

    def __str__(self):
        return self.nazev


class ZnackyVyrobce(models.Model):
    nazev = models.CharField(max_length=255, unique=True)

    class Meta:
        db_table = 'znacky_vyrobce'
        managed = False

    def __str__(self):
        return self.nazev


class Kategorie(models.Model):
    nazev = models.CharField(max_length=255, unique=True)

    class Meta:
        db_table = 'kategorie'
        managed = False

    def __str__(self):
        return self.nazev


class Produkty(models.Model):
    nazev = models.CharField(max_length=255)
    kod_produktu = models.CharField(max_length=255, unique=True)
    kategorie = models.ForeignKey(Kategorie, on_delete=models.CASCADE)
    znacka_vyrobce = models.ForeignKey(ZnackyVyrobce, on_delete=models.CASCADE)
    zeme_puvodu = models.ForeignKey(ZemePuvodu, on_delete=models.CASCADE)

    class Meta:
        db_table = 'produkty'
        managed = False

    def __str__(self):
        return self.nazev



class Sklady(models.Model):
    nazev = models.CharField(max_length=255)

    class Meta:
        db_table = 'sklady'
        managed = False

    def __str__(self):
        return self.nazev


class Meny(models.Model):
    nazev = models.CharField(max_length=255, unique=True)
    iso_kod_meny = models.CharField(max_length=10)
    symbol_meny = models.CharField(max_length=10)

    class Meta:
        db_table = 'meny'
        managed = False

    def __str__(self):
        return self.nazev


class KurzyMeny(models.Model):
    mena_z = models.ForeignKey(Meny, related_name='mena_z', on_delete=models.CASCADE)
    mena_do = models.ForeignKey(Meny, related_name='mena_do', on_delete=models.CASCADE)
    datum_kurzu = models.DateField()
    kurz = models.FloatField()

    class Meta:
        db_table = 'kurzy_meny'
        managed = False

    def __str__(self):
        return f'{self.mena_z} -> {self.mena_do} ({self.datum_kurzu})'


class PohybyZasob(models.Model):
    TYP_POHYBU = [
        (1, 'Příjem'),
        (2, 'Výdej'),
        (3, 'Přesun mezi sklady'),
    ]
    produkt = models.ForeignKey(Produkty, on_delete=models.CASCADE)
    odchozi_sklad = models.ForeignKey(Sklady, related_name='odchozi_sklad', null = True, on_delete=models.CASCADE)
    cilovy_sklad = models.ForeignKey(Sklady, related_name='cilovy_sklad', null = True, on_delete=models.CASCADE)
    typ_pohybu = models.IntegerField(choices=TYP_POHYBU)
    datum_pohybu = models.DateField()
    pocet_kusu_v_baleni = models.IntegerField()
    cena_za_kus = models.FloatField()
    mena = models.ForeignKey(Meny, on_delete=models.CASCADE)
    pocet_baliku_v_pohybu = models.IntegerField()

    class Meta:
        db_table = 'pohyby_zasob'
        managed = False

    def __str__(self):
        return f'{self.produkt.nazev} ({self.datum_pohybu})'


class ZasobyProduktu(models.Model):
    produkt = models.ForeignKey(Produkty, on_delete=models.CASCADE)
    sklad = models.ForeignKey(Sklady, on_delete=models.CASCADE)
    pocet_kusu_v_baleni = models.IntegerField()
    cena_za_kus = models.FloatField()
    mena = models.ForeignKey(Meny, on_delete=models.CASCADE)
    pocet_baliku_ve_skladu = models.IntegerField()

    class Meta:
        db_table = 'zasoby_produktu'
        managed = False

    def __str__(self):
        return f'{self.produkt.nazev} - {self.sklad.nazev}'
