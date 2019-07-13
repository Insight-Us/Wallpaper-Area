from django.urls import path, include
from .views import apiView, CategoryView, UploadCountView
from rest_framework import routers

router = routers.DefaultRouter()
router.register('api', apiView)
router.register('category', CategoryView)
router.register('upload_count', UploadCountView)

urlpatterns = [
    path('', include(router.urls))
]
