'''
    Serializers translates to and from json 
'''
from rest_framework import serializers
from .models import api

class apiSerializer(serializers.ModelSerializer):
    class Meta:
        model = api
        fields = ('id', 'name', 'link', 'uploaded_on', 'category')

# Serializer view
    
