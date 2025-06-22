from django.core.management.base import BaseCommand
import requests
from datetime import date
from ...models import KurzyMeny, Meny

class Command(BaseCommand):
    help = 'Získá aktuální směnný kurz EUR→CZK a uloží ho do databáze'

    def handle(self, *args, **options):
        try:
            # Získání objektů měn EUR a CZK
            eur = Meny.objects.get(iso_kod_meny='EUR')
            czk = Meny.objects.get(iso_kod_meny='CZK')

            # Načtení dat z API
            response = requests.get('https://data.kurzy.cz/json/meny/b[1].json')
            data = response.json()

            # Vytvoření nového záznamu o směnném kurzu
            KurzyMeny.objects.create(
                mena_z=eur,
                mena_do=czk,
                datum_kurzu=date.today(),
                kurz=float(data['kurzy']['EUR']['dev_stred'])
            )
            
            self.stdout.write(self.style.SUCCESS('Úspěšně uložen směnný kurz EUR→CZK'))
        except Meny.DoesNotExist:
            self.stdout.write(self.style.ERROR('Chyba: Měna EUR nebo CZK neexistuje v databázi'))
        except requests.RequestException:
            self.stdout.write(self.style.ERROR('Chyba: Nelze získat data z kurzovního API'))
        except KeyError:
            self.stdout.write(self.style.ERROR('Chyba: Neočekávaný formát dat z API'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Chyba: {str(e)}'))