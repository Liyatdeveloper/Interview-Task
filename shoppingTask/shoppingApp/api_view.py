from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from .models import*
from django.conf import settings
from django.conf.urls.static import static
import os
from django.views.decorators.cache import cache_control
from rest_framework import status
from .serializers import*
from rest_framework.response import Response
from rest_framework.decorators import api_view
import datetime
from datetime import date

# Create your views here.



# Apis
@api_view(['POST'])
def registerData(request):
	serializer = UserSerializer(data=request.data)
	if serializer.is_valid():
		serializer.save()
		return Response({"status": "success", "data": serializer.data}, status=status.HTTP_200_OK)  
	else:
		return Response({"status": "error", "data": serializer.errors}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def loginData(request):
	data = request.data
	email = data.get("email")
	pswd = data.get("pswd")	
	chk=Tbl_User.objects.filter(email=email,pswd=pswd)
	print("----------",chk)
	if chk:
		for x in chk:
			request.session['id']=x.id
			name=x.name
			email=x.email
			pswd=x.pswd
			return Response({"status": "success","id":x.id,"name":name,"email":email,"pswd":pswd}, status=status.HTTP_200_OK)
	else:
		return Response({"status": "error"})

@api_view(['GET'])
def getproductlist(request):
	aa=Tbl_Product.objects.all()
	serializer = ProductSerializer(aa, many=True)
	return Response(serializer.data, status=status.HTTP_200_OK)
@api_view(['POST'])
def get_productdetailview(request):
	data = request.data
	print("---data--",data)
	pid = data.get("id")
	aa = Tbl_Product.objects.all().filter(id=pid)
	serializer = ProductSerializer(aa, many=True)
	return Response(serializer.data, status=status.HTTP_200_OK)

@api_view(['POST'])
def addCart(request):
	data = request.data
	if request.method=="POST":
		product_id = data.get("product_id")
		user_id = data.get("user_id")
		qty = data.get("qty")
		date = datetime.date.today()
		uid=Tbl_User.objects.get(id=user_id)
		pid=Tbl_Product.objects.get(id=product_id)
		price=Tbl_Product.objects.all().filter(id=product_id)
		for x in price:
			amt=x.price
			tot_amt=int(amt)*int(qty)
		aa=Tbl_Cart(product_id=pid,user_id=uid,qty=qty,status='pending',total_price=tot_amt,date=date)
		aa.save()
		# serializer = CartSerializer(aa, many=True)
		return Response({"status": "success"}, status=status.HTTP_200_OK)  
	else:
		return Response({"status": "error"}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def getCartData(request):
	data = request.data
	user_id = data.get("user_id")
	aa=Tbl_Cart.objects.all().filter(user_id=user_id,status='pending')
	serializer = CartSerializer(aa, many=True)
	return Response(serializer.data, status=status.HTTP_200_OK)
     












