from django.urls import path, include
from .views import apiView, CategoryView
from rest_framework import routers
from django.conf import settings
from django.conf.urls.static import static

router = routers.DefaultRouter()
router.register('api', apiView)
router.register('category', CategoryView)

urlpatterns = [
    path('', include(router.urls))
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
