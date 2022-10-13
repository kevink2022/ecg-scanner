from rest_framework import serializers
from .models import ECGScan

class ECGScanSerializer(serializers.ModelSerializer):
    class Meta:
        model = ECGScan
        fields = ['id', 'data', 'image_url']