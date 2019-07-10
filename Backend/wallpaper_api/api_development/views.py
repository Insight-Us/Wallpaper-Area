from django.shortcuts import render
from rest_framework import viewsets
from .models import api, Category
from .serializers import apiSerializer, CategorySerializer

class apiView(viewsets.ModelViewSet):
    queryset = api.objects.all()
    serializer_class = apiSerializer

class CategoryView(viewsets.ReadOnlyModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer