from django.shortcuts import render

from django.http import HttpResponse
from pathlib import Path
import json
from .testECGpython import models



# Create your views here.
def index(request):
    str_path = "/Users/ritijjain/Documents/Repos/CHOT-Project/fullScan.png"
    path = Path(str_path)
    output = models.image_path_to_signal(path)

    
    return HttpResponse(output)
