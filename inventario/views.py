from django.shortcuts import render
from django.http import HttpResponse

def hola(request):
	return HttpResponse("Prueba proyecto")
# Create your views here.
