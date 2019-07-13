from django.shortcuts import render
from rest_framework import viewsets
from .models import api, Category, countUpload
from .serializers import apiSerializer, CategorySerializer, UploadCategoryWiseSerializer

class apiView(viewsets.ReadOnlyModelViewSet):
    queryset = api.objects.all()
    serializer_class = apiSerializer

class CategoryView(viewsets.ReadOnlyModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class UploadCountView(viewsets.ReadOnlyModelViewSet):
    queryset = countUpload.objects.all()
    serializer_class = UploadCategoryWiseSerializer