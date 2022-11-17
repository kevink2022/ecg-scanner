# Generated by Django 4.1.2 on 2022-11-17 19:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("api", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="ecgscan",
            name="img_base64",
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name="ecgscan",
            name="img_binary",
            field=models.BinaryField(blank=True, null=True),
        ),
    ]
