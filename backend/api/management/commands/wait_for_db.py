from django.core.management.base import BaseCommand
import time
from django.db import connections
from django.db.utils import OperationalError

class Command(BaseCommand):
    def handle(self, *args, **kwargs):
        self.stdout.write('Čekání na připojení k databázi...')
        db_conn = None
        while not db_conn:
            try:
                db_conn = connections['default']
                db_conn.cursor()
            except OperationalError:
                self.stdout.write('Databáze není k dispozici, čekám 10 sekund...')
                time.sleep(10)
        self.stdout.write(self.style.SUCCESS('Databáze je k dispozici!'))
