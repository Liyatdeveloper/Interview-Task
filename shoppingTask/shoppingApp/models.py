from django.db import models

# Create your models here.

class Tbl_Admin(models.Model):
	username=models.CharField(max_length=50,default='')
	email=models.CharField(max_length=50,default='')
	pswd=models.CharField(max_length=50,default='')

class Tbl_User(models.Model):
	name=models.CharField(max_length=50,default='')
	email=models.CharField(max_length=50,default='')
	pswd=models.CharField(max_length=50,default='')
	phone=models.CharField(max_length=50,default='')
	address=models.CharField(max_length=100,default='')

class Tbl_Product(models.Model):
	name=models.CharField(max_length=50,default='')
	img=models.ImageField(upload_to='products/', default='')
	qty=models.CharField(max_length=50,default='')
	price=models.CharField(max_length=50,default='')
	details=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=50,default='')

class Tbl_Cart(models.Model):
    qty = models.CharField(max_length=100, default='')
    date = models.CharField(max_length=100, default='')
    total_price = models.CharField(max_length=100, default='')
    status = models.CharField(max_length=100, default='')
    product_id = models.ForeignKey(Tbl_Product, on_delete=models.CASCADE, blank=True, null=True)
    user_id = models.ForeignKey(Tbl_User, on_delete=models.CASCADE, blank=True, null=True)

class order_item_tb(models.Model):
    user_id = models.ForeignKey(Tbl_User, on_delete=models.CASCADE)
    product_id = models.ForeignKey(Tbl_Product, on_delete=models.CASCADE)
    cart_id = models.ForeignKey(Tbl_Cart, on_delete=models.CASCADE)
    total = models.CharField(max_length=30, default='')
    date = models.CharField(max_length=100, default='')
    time = models.CharField(max_length=100, default='')
    payment_status = models.CharField(max_length=30, default='')
    packing_status = models.CharField(max_length=30, default='')
