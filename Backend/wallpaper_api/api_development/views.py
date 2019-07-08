from django.shortcuts import render
from rest_framework import viewsets
from .models import api
from .serializers import apiSerializer

class apiView(viewsets.ModelViewSet):
    queryset = api.objects.all()
    serializer_class = apiSerializer