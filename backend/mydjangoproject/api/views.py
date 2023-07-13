from django.shortcuts import render, get_object_or_404

from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import 	IsAuthenticated

from .serializers import ProductSerializer, RegisterSerializer
from .models import Product

@api_view(['GET'])
def apiOverview(request):
	api_urls = {
		'List':'/product-list/',
		'Detail View':'/product-detail/<str:pk>/',
		'Add':'/product-add/',
		'Delete':'/product-delete/<str:pk>/',
		'Purchase':'/product-purchase/<str:pk>/',
		}

	return Response(api_urls)

@api_view(['GET'])
def productList(request):
	products = Product.objects.all().order_by('-id')
	serializer = ProductSerializer(products, many=True)
	return Response(serializer.data)

@api_view(['GET'])
def productDetail(request, pk):
	products = get_object_or_404(Product, id=pk)
	serializer = ProductSerializer(products, many=False)
	return Response(serializer.data)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def productAdd(request):
	serializer = ProductSerializer(data=request.data)

	serializer.is_valid(raise_exception=True)
	serializer.save(created_by = request.user, is_available = True)

	return Response(serializer.data, status=201)


@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def productDelete(request, pk):
	product = get_object_or_404(Product, id=pk)

	if product.created_by != request.user:
		return Response('You are not allowed to delete this product.', status=403)
	
	product.delete()
	return Response('Item succsesfully deleted!', status=204)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def productPurchase(request, pk):
	product = get_object_or_404(Product, id=pk)

	if product.created_by == request.user:
		return Response('Cannot purchase your own product')
	if not product.is_available:
		return Response('Product has already been purchased')
	
	product.purchase(request.user)
	return Response('Purchased')

@api_view(['POST'])
def signup(request):
    serializer = RegisterSerializer(data=request.data)
    
    serializer.is_valid(raise_exception=True)
    serializer.save()
    
    return Response(serializer.data)