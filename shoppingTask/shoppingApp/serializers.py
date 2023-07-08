from rest_framework import serializers
from .models import*


class UserSerializer(serializers.ModelSerializer):
	class Meta:
		model=Tbl_User
		fields='__all__'

class ProductSerializer(serializers.ModelSerializer):
	class Meta:
		model=Tbl_Product
		fields='__all__'
class CartSerializer(serializers.ModelSerializer):
	class Meta:
		model=Tbl_Cart
		fields='__all__'
class OrderSerializer(serializers.ModelSerializer):
	class Meta:
		model=order_item_tb
		fields='__all__'

