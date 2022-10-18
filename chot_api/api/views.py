from django.shortcuts import render

from django.http import HttpResponse
from pathlib import Path
import json
from .testECGpython import models

from rest_framework import status, viewsets




# Create your views here.
def index(request):
    str_path = "/Users/ritijjain/Documents/Repos/CHOT-Project/fullScan.png"
    path = Path(str_path)
    output = models.image_path_to_signal(path)

    
    return HttpResponse(output)

from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializer import ECGScanSerializer

class ECGScanIn(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def post(self, request, format=None):
        serializer = ECGScanSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            str_path = f"/Users/ritijjain/Documents/Repos/CHOT-Project{serializer.data['image_url']}"
            print(str_path)
            path = Path(str_path)
            output = models.image_path_to_signal(path)
            print(output)
            return Response(output, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)