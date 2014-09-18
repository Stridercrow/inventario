from django.contrib import admin
from inventario.models import Equipo, Ubicacion, Tipo, Referencia

admin.site.register(Equipo)
admin.site.register(Ubicacion)
admin.site.register(Tipo)
admin.site.register(Referencia)