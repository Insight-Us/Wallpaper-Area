from django.urls import path, include
from .views import apiView
from rest_framework import routers

router = routers.DefaultRouter()
router.register('api', apiView)

urlpatterns = [
    path('', include(router.urls))
]
