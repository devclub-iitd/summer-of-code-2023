# Generated by Django 4.2.2 on 2023-06-29 11:38

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ("mydjangoapp", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="product",
            name="addDate",
            field=models.DateTimeField(
                default=django.utils.timezone.now, verbose_name="date added"
            ),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name="product",
            name="sold",
            field=models.BooleanField(default=False),
        ),
    ]
