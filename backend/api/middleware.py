from django.http import HttpResponseForbidden
from django.conf import settings
import logging

logger = logging.getLogger(__name__)

class APISecretMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Ignorovat kontroly pro všechny cesty mimo API
        if not request.path.startswith('/api/'):
            return self.get_response(request)
            
        # Kontrola bezpečnostního headeru
        secret = request.headers.get(settings.SECRET_API_HEADER)
        
        '''
        # Povolit přístup z localhostu, když je DEBUG = True (volitelné)
        if settings.DEBUG and request.META.get('REMOTE_ADDR') in ['127.0.0.1', '::1']:
            return self.get_response(request)
        '''  
        
        if secret != settings.SECRET_API_KEY:
            logger.warning(f"Neoprávněný pokus o přístup z IP: {request.META.get('REMOTE_ADDR')}")
            return HttpResponseForbidden("Přístup odepřen: Neplatný API klíč")
            
        return self.get_response(request)