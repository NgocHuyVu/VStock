from django.core.management.base import BaseCommand
import requests
from datetime import date
from ...models import KurzyMeny, Meny

class Command(BaseCommand):
    help = 'Fetches EUR to CZK exchange rate and stores it in database'

    def handle(self, *args, **options):
        try:
            # Get EUR and CZK currency objects
            eur = Meny.objects.get(iso_kod_meny='EUR')
            czk = Meny.objects.get(iso_kod_meny='CZK')
            
            # Fetch data from API
            response = requests.get('https://data.kurzy.cz/json/meny/b[1].json')
            data = response.json()
            
            # Create new exchange rate record
            KurzyMeny.objects.create(
                mena_z=eur,
                mena_do=czk,
                datum_kurzu=date.today(),
                kurz=float(data['kurzy']['EUR']['dev_stred'])
            )
            
            self.stdout.write(self.style.SUCCESS('Successfully fetched and stored EUR→CZK rate'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'Error: {str(e)}'))