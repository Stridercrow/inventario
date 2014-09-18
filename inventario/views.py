from django.shortcuts import render
from django.http import HttpResponse
from inventario.models import Equipo
from inventario.models import Tipo

def f_busqueda(request):
    errores = []
    if 'q' in request.GET:
        if 'opc' in request.GET:
            x = request.GET['opc']
        q = request.GET['q']
        if not q:
            errores.append('Introduce un termino de busqueda')
        elif len(q) > 10:
            errores.append('La busqueda no debe exceder los 10 digitos')
        else:
            eq = Equipo.objects.filter(id_corp__icontains=q)
            return render(request,'r_busqueda.html',{'equipo':eq, 'busqueda':q, 'opc':x})
    return render(request,'f_busqueda.html',{'errores':errores})

def inicio(request):
    return render(request,'inicio.html')