from django.contrib import admin
from .models import api, Category, countUpload

# Register your models here.
admin.site.register(api)
admin.site.register(countUpload)
admin.site.register(Category)