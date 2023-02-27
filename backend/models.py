from django.db import models
from django.contrib.auth.models import AbstractUser
import uuid

class Clients(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    full_name = models.CharField(max_length=255)
