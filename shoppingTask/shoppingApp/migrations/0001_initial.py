# Generated by Django 4.1.7 on 2023-07-07 17:16

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Tbl_Admin',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(default='', max_length=50)),
                ('email', models.CharField(default='', max_length=100)),
                ('pswd', models.CharField(default='', max_length=100)),
            ],
        ),
    ]
