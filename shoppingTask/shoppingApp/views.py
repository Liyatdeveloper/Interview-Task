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
from .api_view import*
import requests

# Create your views here.

def index(request):
	return render(request,'index.html')
def about(request):
	return render(request,'about.html')
def admin_login(request):
	if request.method=="POST":
		email=request.POST['email']
		pswd=request.POST['pswd']
		var=Tbl_Admin.objects.all().filter(email=email,pswd=pswd)
		if var:
			for x in var:
				request.session['id']=x.id
			return render(request,'Admin/admin_home.html')
		else:
			txt="""<script>alert('Invalid credentials...');window.location='/admin_login/';</script>"""
			return HttpResponse(txt)
	else:
		return render(request,'admin_login.html')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def logout(request):
	if request.session.has_key('id'):
		del request.session['id']
		logout(request)
	return HttpResponseRedirect('/')






# Apis
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def register(request):
    if request.method == "POST":
        response = registerData(request)
        if response.status_code == status.HTTP_200_OK:
            return render(request, 'register.html')
        else:
            return response
    else:
        return render(request, 'register.html')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def login(request):
	if request.method == "POST":
		response = loginData(request)
		if response.status_code == status.HTTP_200_OK:
			return render(request, 'user/user_home.html')
		else:
			txt="""<script>alert('Invalid credentials...');window.location='/login/';</script>"""
			return HttpResponse(txt)
	else:
		return render(request,'login.html')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_home(request):
	if request.session.has_key('id'):
		return render(request, 'user/user_home.html')
	else:
		return HttpResponseRedirect('/')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def productlist(request):
	if request.session.has_key('id'):
	    response = getproductlist(request)
	    if response.status_code == status.HTTP_200_OK:
	        products = response.data 
	        # print("-----",products)
	        return render(request, 'user/user_productlist.html', {'products': products})
	    else:
	        return render(request, 'user/user_productlist.html')
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_view_productdetail(request):
	if request.session.has_key('id'):
		pid=request.GET.get('id')
		api_url = 'http://localhost:8000/api_get_productdetailview/'
		data = {'id': pid}
		response = requests.post(api_url, data=data)
		print("----resp--",response)
		if response.status_code == status.HTTP_200_OK:
			products = response.json()
			print("-----",products)
			return render(request, 'user/user_view_productdetail.html', {'products': products,'pid':pid})
		else:
			return render(request, 'user/user_view_productdetail.html')
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def add_to_cart(request):
	if request.session.has_key('id'):
	    myid = request.session['id']
	    ii = request.GET.get('id')
	    number = request.GET['number']
	    api_url='http://localhost:8000/api_addCart/'
	    data={'product_id':ii,'user_id':myid,'qty':number}
	    response = requests.post(api_url, data=data)
	    print("----resp--",response)
	    if response.status_code == status.HTTP_200_OK:
	    	products = response.json()
	    	print("-----",products)
	    	return HttpResponseRedirect('/user_cartpage/')
	    else:
	    	return response
	else:
		return HttpResponseRedirect('/')






@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_cartpage(request):
	if request.session.has_key('id'):
		myid = request.session['id']
		var = Tbl_Cart.objects.all().filter(user_id=myid, status='pending')
		sum1 = 0
		for x in var:
			a = x.total_price
			sum1 = sum1+int(a)
			print(sum1)
		return render(request, 'User/user_cartpage.html', {'var': var, 'sum': sum1})
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def delete_cart(request):
	if request.session.has_key('id'):
	    ii = request.GET['id']
	    Tbl_Cart.objects.all().filter(id=ii).delete()
	    return HttpResponseRedirect('/user_cartpage/')
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def cart_product_payment(request):
	if request.session.has_key('id'):
	    myid = request.session['id']
	    if request.method == "POST":
	        uid = Tbl_User.objects.get(id=myid)
	        carid = request.POST.getlist('carid')
	        for i in carid:
	            crrid = i
	        print("----", carid)
	        cart_id = Tbl_Cart.objects.all().filter(id=crrid)
	        amount = request.POST["subtotal"]
	        current_date = date.today()
	        now = datetime.datetime.now()
	        current_time = now.strftime("%H:%M:%S")
	        for x in cart_id:
	            prid = x.product_id.id
	            cartid = x.id
	            pid = Tbl_Product.objects.get(id=prid)
	            cid = Tbl_Cart.objects.get(id=cartid)
	            order_item_tb(user_id=uid, product_id=pid,cart_id=cid, total=amount, date=current_date, time=current_time, payment_status='pending', packing_status='pending').save()
	            var = order_item_tb.objects.last().id
	            oid = order_item_tb.objects.get(id=var)
	        return HttpResponseRedirect('/payment/')
	    else:
	        return render(request, 'user/user_payment.html')
	else:
		return HttpResponseRedirect('/')
        
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def payment(request):
    if request.session.has_key('id'):
        myid = request.session["id"]
        var = order_item_tb.objects.last().id
        if request.method == "POST":
            Tbl_Cart.objects.all().filter(user_id=myid).update(status='paid')
            order_item_tb.objects.all().filter(id=var).update(payment_status='paid')
            return HttpResponseRedirect('/productlist/')
        else:
            myid = request.session["id"]
            user = Tbl_User.objects.all().filter(id=myid)
            return render(request, 'User/user_payment.html', {'db': user})
    else:
        return render(request, 'login.html')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_address(request):
	if request.session.has_key('id'):
	    myid = request.session['id']
	    var = Tbl_User.objects.all().filter(id=myid)
	    if request.method=="POST":
	    	address=request.POST['address']
	    	Tbl_User.objects.all().filter(id=myid).update(address=address)
	    	return HttpResponseRedirect('/productlist/')
	    else:
	    	return render(request, 'User/user_address.html', {'var': var})
	else:
		return HttpResponseRedirect('/')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_order_status(request):
	if request.session.has_key('id'):
	    myid = request.session['id']
	    var = order_item_tb.objects.all().filter(user_id=myid)
	    return render(request, 'User/user_order_status.html', {'var': var})
	else:
		return HttpResponseRedirect('/')












# ___________Admin
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def admin_home(request):
	if request.session.has_key('id'):
		return render(request,'Admin/admin_home.html')
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def admin_add_product(request):
	if request.session.has_key('id'):
		if request.method=="POST":
			name=request.POST['name']
			img=request.FILES['img']
			qty=request.POST['qty']
			price=request.POST['price']
			details=request.POST['details']
			Tbl_Product(name=name,img=img,qty=qty,price=price,details=details,status='pending').save()
			return render(request,'Admin/admin_add_product.html')
		else:
			return render(request,'Admin/admin_add_product.html')
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def admin_view_product(request):
	if request.session.has_key('id'):
		var=Tbl_Product.objects.all()
		return render(request,'Admin/admin_view_product.html',{'var':var})
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def admin_delete_product(request):
	if request.session.has_key('id'):
		pid=request.GET['id']
		var=Tbl_Product.objects.all().filter(id=pid).delete()
		return HttpResponseRedirect('/admin_view_product/')
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def admin_edit_product(request):
	if request.session.has_key('id'):
		if request.method=="POST":
			name=request.POST['name']
			# img=request.FILES['img']
			qty=request.POST['qty']
			price=request.POST['price']
			details=request.POST['details']
			idd=request.POST['pid']
			Tbl_Product.objects.all().filter(id=idd).update(name=name,qty=qty,price=price,details=details)
			return HttpResponseRedirect('/admin_view_product/')
		else:
			pid=request.GET['id']
			var=Tbl_Product.objects.all().filter(id=pid)
			return render(request,'Admin/admin_edit_product.html',{'var':var,'pid':pid})
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def admin_customerlist(request):
	if request.session.has_key('id'):
		var=Tbl_User.objects.all()
		return render(request,'Admin/admin_customerlist.html',{'var':var})
	else:
		return HttpResponseRedirect('/')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def admin_orderlist(request):
	if request.session.has_key('id'):
		myid=request.session['id']
		# var=order_item_tb.objects.all()
		var = order_item_tb.objects.all().filter(packing_status='pending')
		var2 = order_item_tb.objects.all().filter(packing_status='processing')
		var5= order_item_tb.objects.all().filter(packing_status='shipped')
		var3 = order_item_tb.objects.all().filter( packing_status='delivered')
		var4 = order_item_tb.objects.all().filter(packing_status='reject')
		return render(request,'Admin/admin_orderlist.html',{'var5':var5,'var': var, 'var2': var2, 'var3': var3,'var4':var4})
	else:
		return HttpResponseRedirect('/')

def admin_processing_request(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(id=ii).update(packing_status='processing')
    return HttpResponseRedirect('/admin_orderlist/')
def admin_reject_request(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(id=ii).update(packing_status='reject')
    return HttpResponseRedirect('/admin_orderlist/')
def admin_shipped_request(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(id=ii).update(packing_status='shipped')
    return HttpResponseRedirect('/admin_orderlist/')
def admin_delivered_request(request):
    ii = request.GET['id']
    var = order_item_tb.objects.all().filter(id=ii, payment_status='paid').update(packing_status='delivered')
    return HttpResponseRedirect('/admin_orderlist/')