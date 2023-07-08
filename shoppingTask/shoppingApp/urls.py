from django.contrib import admin
from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('',views.index),
    path('about/',views.about),
    path('admin_login/',views.admin_login),
    path('logout/',views.logout),




    # Api
    path('register/',views.register),
    path('login/',views.login),
    path('productlist/',views.productlist),
    path('user_home/',views.user_home),
    path('user_view_productdetail/',views.user_view_productdetail),
    path('api_get_productdetailview/',views.get_productdetailview),
    path('api_addCart/',views.addCart),
    path('add_to_cart/',views.add_to_cart),
    path('user_cartpage/',views.user_cartpage),
    path('api_getCartData/',views.getCartData),
    path('cart_product_payment/',views.cart_product_payment),
    path('payment/',views.payment),
    path('user_order_status/',views.user_order_status),
    path('delete_cart/',views.delete_cart),
    path('user_address/',views.user_address),



    # Admin/Shop
    path('admin_home/',views.admin_home),
    path('admin_add_product/',views.admin_add_product),
    path('admin_view_product/',views.admin_view_product),
    path('admin_delete_product/',views.admin_delete_product),
    path('admin_edit_product/',views.admin_edit_product),
    path('admin_customerlist/',views.admin_customerlist),
    path('admin_orderlist/',views.admin_orderlist),
    path('admin_processing_request/',views.admin_processing_request),
    path('admin_reject_request/',views.admin_reject_request),
    path('admin_shipped_request/',views.admin_shipped_request),
    path('admin_delivered_request/',views.admin_delivered_request),
   

    
    





]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)