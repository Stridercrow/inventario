from django.conf.urls import patterns, include, url
from django.contrib import admin
from inventario.views import *

urlpatterns = patterns('',
	url(r'^inicio/$', inicio),
	url(r'^busqueda/$', f_busqueda),
)