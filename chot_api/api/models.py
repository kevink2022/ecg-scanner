from django.db import models
from random import randrange
from django.utils import timezone
import os

# Create your models here.

def upload_to(instance, filename):
        now = timezone.now()
        base, extension = os.path.splitext(filename.lower())
        milliseconds = now.microsecond // 1000
        return f"users/{instance.pk}/{now:%Y%m%d%H%M%S}{milliseconds}{extension}"

class ECGScan(models.Model):
    image_url = models.ImageField(upload_to=upload_to, blank=True, null=True)
    data = models.TextField(blank=True, null=True)
    img_binary = models.BinaryField(blank=True, null=True)

    img_base64 = models.TextField(blank=True, null=True) 
