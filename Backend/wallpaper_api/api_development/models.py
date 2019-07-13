from django.db import models

# Create your models here.
class Category(models.Model):
    category_name = models.CharField(max_length=100)
    cover_page = models.CharField(max_length=150, null=True)
    

    def __str__(self):
        return self.category_name
    

class api(models.Model):
    name = models.CharField(max_length=120)
    link = models.CharField(max_length=500)
    uploaded_on = models.DateField(auto_now=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True)
    

    def __str__(self):
        return self.name

    

class countUpload(models.Model):
    count = models.IntegerField()
    image = models.ForeignKey(api, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.count

