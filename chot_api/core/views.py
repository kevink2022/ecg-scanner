from django.shortcuts import render
from .models import image_path_to_signal
from pathlib import Path

# Create your views here.

def index(request):
    return render(request, image_path_to_signal(Path('/Users/ritijjain/Documents/Repos/CHOT-Project/fullScan.png')))