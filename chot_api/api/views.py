from django.shortcuts import render

from django.http import HttpResponse, JsonResponse
from pathlib import Path
import json
from .testECGpython import models

from rest_framework import status, viewsets
import json
import base64



# Create your views here.
def index(request):
    str_path = "/Users/ritijjain/Documents/Repos/CHOT-Project/fullScan.png"
    path = Path(str_path)
    output = models.image_path_to_signal(path)

    
    return JsonResponse(output, safe=False)

from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializer import ECGScanSerializer

import os
from django.conf import settings
from django.core.files.base import ContentFile



class ECGScanIn(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def post(self, request, format=None):
        serializer = ECGScanSerializer(data=request.data)
        if serializer.is_valid():

            instance = serializer.save() # Save all data
            print(instance)
            data = instance.img_base64 # base64 data

            format, imgstr = data.split(';base64,')
            ext = format.split('/')[-1] 
            
            single_decode = base64.b64decode(imgstr)
            double_decode = base64.b64decode(single_decode)

            data = ContentFile(double_decode, name='temp.' + ext)
        
            instance.image_url = data
            instance.img_base64 = ''
            instance.save()

            str_path = f"/app/media/{instance.image_url}"
            path = Path(str_path)
            # print(path)
            output = models.image_path_to_signal(path)
            # # print(output)


            for key in output.keys():
                for i, element in enumerate(output[key]):
                    if str(element) == "nan":
                        print(str(element))
                        output[key][i] = output[key][i+2]
                        # pos = array.index(num)
                        # num = array[pos+ 1]


                

            return JsonResponse(output, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



