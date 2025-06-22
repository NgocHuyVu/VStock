from rest_framework import serializers
from .models import (
    Produkty,
    Sklady,
    PohybyZasob,
    ZasobyProduktu,
    ZemePuvodu,
    ZnackyVyrobce,
    Kategorie,
    Meny,
    KurzyMeny
)

class ZemePuvoduSerializer(serializers.ModelSerializer):
    class Meta:
        model = ZemePuvodu
        fields = '__all__'
        
class ZnackyVyrobceSerializer(serializers.ModelSerializer):
    class Meta:
        model = ZnackyVyrobce
        fields = '__all__'

class KategorieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Kategorie
        fields = '__all__'  

class MenySerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Meny
        fields = '__all__'

class KurzyMenySerializer(serializers.ModelSerializer):
    mena_z = serializers.CharField(source='mena_z.iso_kod_meny')
    mena_do = serializers.CharField(source='mena_do.iso_kod_meny')
    class Meta:
        model = KurzyMeny
        fields = '__all__'       

class ProduktySerializer(serializers.ModelSerializer):
    kategorie = serializers.CharField(source='kategorie.nazev')  
    znacka_vyrobce = serializers.CharField(source='znacka_vyrobce.nazev')  
    zeme_puvodu = serializers.CharField(source='zeme_puvodu.nazev')  

    class Meta:
        model = Produkty
        fields = ['id', 'nazev', 'kod_produktu', 'kategorie', 'znacka_vyrobce', 'zeme_puvodu']

    def create(self, validated_data):
        kategorie_data = validated_data.pop('kategorie')
        znacka_data = validated_data.pop('znacka_vyrobce')
        zeme_data = validated_data.pop('zeme_puvodu')

        kategorie, _ = Kategorie.objects.get_or_create(nazev=kategorie_data['nazev'])
        znacka, _ = ZnackyVyrobce.objects.get_or_create(nazev=znacka_data['nazev'])
        zeme, _ = ZemePuvodu.objects.get_or_create(nazev=zeme_data['nazev'])

        product = Produkty.objects.create(
            kategorie=kategorie,
            znacka_vyrobce=znacka,
            zeme_puvodu=zeme,
            **validated_data
        )
        return product
    
    def update(self, instance, validated_data):
        kategorie_data = validated_data.pop('kategorie', None)
        znacka_data = validated_data.pop('znacka_vyrobce', None)
        zeme_data = validated_data.pop('zeme_puvodu', None)

        if kategorie_data:
            instance.kategorie, _ = Kategorie.objects.get_or_create(nazev=kategorie_data['nazev'])
        if znacka_data:
            instance.znacka_vyrobce, _ = ZnackyVyrobce.objects.get_or_create(nazev=znacka_data['nazev'])
        if zeme_data:
            instance.zeme_puvodu, _ = ZemePuvodu.objects.get_or_create(nazev=zeme_data['nazev'])

        for attr, value in validated_data.items():
            setattr(instance, attr, value)

        instance.save()
        return instance

class SkladySerializer(serializers.ModelSerializer):
    class Meta:
        model = Sklady
        fields = '__all__'

    def create(self, validated_data):
        try:
            sklad = Sklady.objects.create(**validated_data)
            return sklad
        except Exception as e:
            print(f"Error creating sklad: {e}")
            raise serializers.ValidationError("Error creating sklad.")

    def update(self, instance, validated_data):
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        try:
            instance.save()
        except Exception as e:
            print(f"Error updating sklad: {e}")
            raise serializers.ValidationError("Error updating sklad.")
        return instance


class PohybyZasobSerializer(serializers.ModelSerializer):
    odchozi_sklad = serializers.CharField(source='odchozi_sklad.nazev', allow_null=True, required=False)
    cilovy_sklad = serializers.CharField(source='cilovy_sklad.nazev', allow_null=True, required=False)
    produkt = serializers.CharField(source='produkt.kod_produktu')
    mena = serializers.CharField(source='mena.iso_kod_meny')
    
    class Meta:
        model = PohybyZasob
        fields = '__all__'
        extra_kwargs = {
            'odchozi_sklad_id': {'write_only': True, 'required': False},
            'cilovy_sklad_id': {'write_only': True, 'required': False},
            'produkt_id': {'write_only': True},
            'mena_id': {'write_only': True},
        }

    def to_internal_value(self, data):
        internal_data = super().to_internal_value(data)
        
        # Handle produkt - make sure it exists and is required
        if 'produkt' not in data:
            raise serializers.ValidationError({
                'produkt': "Toto pole je povinné."
            })
        try:
            produkt = Produkty.objects.get(kod_produktu=data['produkt'])
            internal_data['produkt_id'] = produkt.id
        except Produkty.DoesNotExist:
            raise serializers.ValidationError({
                'produkt': f"Produkt s kódem '{data['produkt']}' neexistuje"
            })

        # Handle mena - make sure it exists and is required
        if 'mena' not in data:
            raise serializers.ValidationError({
                'mena': "Toto pole je povinné."
            })
        try:
            mena = Meny.objects.get(iso_kod_meny=data['mena'])
            internal_data['mena_id'] = mena.id
        except Meny.DoesNotExist:
            raise serializers.ValidationError({
                'mena': f"Měna s kódem  '{data['mena']}' neexistuje"
            })

        # Handle odchozi_sklad
        if 'odchozi_sklad' in data and data['odchozi_sklad'] is not None:
            try:
                sklad = Sklady.objects.get(nazev=data['odchozi_sklad'])
                internal_data['odchozi_sklad_id'] = sklad.id
            except Sklady.DoesNotExist:
                raise serializers.ValidationError({
                    'odchozi_sklad': f"Sklad '{data['odchozi_sklad']}' neexistuje"
                })

        # Handle cilovy_sklad
        if 'cilovy_sklad' in data and data['cilovy_sklad'] is not None:
            try:
                sklad = Sklady.objects.get(nazev=data['cilovy_sklad'])
                internal_data['cilovy_sklad_id'] = sklad.id
            except Sklady.DoesNotExist:
                raise serializers.ValidationError({
                    'cilovy_sklad': f"Sklad '{data['cilovy_sklad']}' neexistuje"
                })

        return internal_data

    def validate(self, data):
        typ_pohybu = data.get('typ_pohybu')
        odchozi_sklad_id = data.get('odchozi_sklad_id')
        cilovy_sklad_id = data.get('cilovy_sklad_id')

        if typ_pohybu == 1:  # Příjem (Incoming)
            if odchozi_sklad_id is not None:
                raise serializers.ValidationError(
                    {"odchozi_sklad": "Odchozí sklad musí být prázdný pro typ Příjem"}
                )
            if cilovy_sklad_id is None:
                raise serializers.ValidationError(
                    {"cilovy_sklad": "Cilový sklad je povinný pro typ Příjem"}
                )

        elif typ_pohybu == 2:  # Výdej (Outgoing)
            if odchozi_sklad_id is None:
                raise serializers.ValidationError(
                    {"odchozi_sklad": "Odchozí sklad je povinný pro typ Výdej"}
                )
            if cilovy_sklad_id is not None:
                raise serializers.ValidationError(
                    {"cilovy_sklad": "Cilový sklad musí být prázdný pro typ Výdej"}
                )

        elif typ_pohybu == 3:  # Přesun (Transfer)
            if odchozi_sklad_id is None:
                raise serializers.ValidationError(
                    {"odchozi_sklad": "Odchozí sklad je povinný pro typ Přesun"}
                )
            if cilovy_sklad_id is None:
                raise serializers.ValidationError(
                    {"cilovy_sklad": "Cilový sklad je povinný pro typ Přesun"}
                )
            if odchozi_sklad_id == cilovy_sklad_id:
                raise serializers.ValidationError(
                    {"cilovy_sklad": "Cilový sklad musí být jiný než Odchozí sklad"}
                )

        return data

    def create(self, validated_data):
        validated_data.pop('odchozi_sklad', None)
        validated_data.pop('cilovy_sklad', None)
        validated_data.pop('produkt', None)
        validated_data.pop('mena', None)
        
        return super().create(validated_data)

    def update(self, instance, validated_data):
        validated_data.pop('odchozi_sklad', None)
        validated_data.pop('cilovy_sklad', None)
        validated_data.pop('produkt', None)
        validated_data.pop('mena', None)
        
        return super().update(instance, validated_data)

class ZasobyProduktuSerializer(serializers.ModelSerializer):
    kod_produktu = serializers.CharField(source='produkt.kod_produktu')
    nazev_produktu = serializers.CharField(source='produkt.nazev')
    kategorie = serializers.CharField(source='produkt.kategorie.nazev')
    znacka_vyrobce = serializers.CharField(source='produkt.znacka_vyrobce.nazev')
    zeme_puvodu = serializers.CharField(source='produkt.zeme_puvodu.nazev')
    mena = serializers.CharField(source='mena.iso_kod_meny')
    sklad = serializers.CharField(source='sklad.nazev')

    class Meta:
        model = ZasobyProduktu
        fields = '__all__'
