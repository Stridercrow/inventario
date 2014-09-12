from django.db import models

class Equipo(models.Model):
	serial_n = models.CharField(max_length=15, primary_key=True)
	id_corp  = models.CharField(max_length=10)
	usr_act  = models.CharField(max_length=45)
	id_user  = models.CharField(max_length=15)	
	usr_ant1 = models.CharField(max_length=40)
	usr_ant2 = models.CharField(max_length=40)
	usr_ant3 = models.CharField(max_length=40)
	fec_cam  = models.DateField(auto_now=True)
	observ   = models.CharField(max_length=100)
	id_ubi   = models.ForeignKey('Ubicacion')	
	id_tip   = models.ForeignKey('Tipo')
	id_ref   = models.ForeignKey('Referencia')

class Ubicacion(models.Model):	
	nombre    = models.CharField(max_length=20)
	direccion = models. CharField(max_length=120)

class Tipo(models.Model):
	marca    = models.CharField(max_length=10)
	modelo   = models.CharField(max_length=25)
	part_num = models.CharField(max_length=15)
	etiqueta = models.CharField(max_length=11)

class Referencia(models.Model):
	nombre = models.CharField(max_length=20)
	ref = models.CharField(max_length=30)


