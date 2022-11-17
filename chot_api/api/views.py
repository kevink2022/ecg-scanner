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
            data = instance.img_base64 # base64 data

            format, imgstr = data.split(';base64,')
            ext = format.split('/')[-1] 
            data = ContentFile(base64.b64decode(imgstr), name='temp.' + ext)
            instance.image = data
            instance.img_base64 = ''
            instance.save()

            str_path = f"/app/{instance.image_url}"
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


            # output = json.loads(json.dumps(output, allow_nan=False))
            # print("hello")
            # for i in range(0, 11):
            #     len_of_i = len(output[i])
            #     print(output[str(i)])
            #     for j in range(0, len_of_i):
            #         print(output[str(i)][j])
            #         try:
            #             output[str(i)][j] == "nan"
            #         except:
            #             output[str(i)][j] = output[str(i)][j+1]
                

            return JsonResponse(output, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



