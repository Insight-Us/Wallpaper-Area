'''
    Serializers translates to and from json 
'''
from rest_framework import serializers
from .models import api, Category

class apiSerializer(serializers.ModelSerializer):
    class Meta:
        model = api
        fields = ('id', 'name', 'link_original', 'link_thumbnail','uploaded_on', 'category')

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('id', 'category_name', 'cover_page')


    
