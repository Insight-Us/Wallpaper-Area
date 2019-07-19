from django.db import models
from imagekit.models import ImageSpecField
from imagekit.processors import ResizeToFill
from django.db.models.signals import pre_delete
from django.dispatch.dispatcher import receiver


class Category(models.Model):
    category_name = models.CharField(max_length=100)
    cover_page = models.CharField(max_length=150, null=True)

    def __str__(self):
        return self.category_name


class api(models.Model):
    name = models.CharField(max_length=120)
    link_original = models.CharField(max_length=1000, null=True, blank=True)
    link_thumbnail = models.CharField(max_length=500, null=True, blank=True)
    image = models.ImageField(upload_to='wallpapers', blank=True, null=True)
    image_thumbnail = ImageSpecField(source='image', processors=[ResizeToFill(100, 50)],
                                     format='JPEG', options={'quality': 60})

    uploaded_on = models.DateField(auto_now=True)
    category = models.ForeignKey(
        Category, on_delete=models.CASCADE, blank=True)

    def __str__(self):
        return self.name

    def save(self):
        self.link_original = self.image.url
        self.link_thumbnail = self.image_thumbnail.url
        super(api, self).save()


@receiver(pre_delete, sender=api)
def api_modifier(sender, instance, **kwargs):
    instance.image.delete(False)
    # instance.image_thumbnail.delete(False)
