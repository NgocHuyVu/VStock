import os
import sys
import django

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "vstock_backend.settings")

    try:
        from django.core.management import execute_from_command_line
    except ImportError:
        raise ImportError(
            "Nelze importovat Django. Musíte Django nainstalovat do svého prostředí."
        )
    django.setup()

    execute_from_command_line(sys.argv)
