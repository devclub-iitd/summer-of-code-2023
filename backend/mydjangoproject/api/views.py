from django.shortcuts import get_object_or_404

from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import 	IsAuthenticated

from .serializers import ProductSerializer, RegisterSerializer
from .models import Product


class apiOverviewAPIView(APIView):

	def get(self, request):
		api_urls = {
			'List':'/product-list/',
			'Detail View':'/product-detail/<str:pk>/',
			'Add':'/product-add/',
			'Delete':'/product-delete/<str:pk>/',
			'Purchase':'/product-purchase/<str:pk>/',
			}

		return Response(api_urls)


class productListAPIView(APIView):

	def get(self, request):
		products = Product.objects.all().order_by('-id')
		serializer = ProductSerializer(products, many=True)
		return Response(serializer.data)


class productDetailAPIView(APIView):

	def get(self, request, pk):
		products = get_object_or_404(Product, id=pk)
		serializer = ProductSerializer(products, many=False)
		return Response(serializer.data)


class productAddAPIView(APIView):
	permission_classes = [IsAuthenticated]

	def post(self, request):
		serializer = ProductSerializer(data=request.data)

		serializer.is_valid(raise_exception=True)
		serializer.save(created_by = request.user, is_available = True)

		return Response(serializer.data, status=201)


class productDeleteAPIView(APIView):
	permission_classes = [IsAuthenticated]

	def delete(self, request, pk):
		product = get_object_or_404(Product, id=pk)

		if product.created_by != request.user:
			return Response('You are not allowed to delete this product.', status=403)
		
		product.delete()
		return Response('Item succsesfully deleted!', status=204)


class productPurchaseAPIView(APIView):
	permission_classes = [IsAuthenticated]

	def post(self, request, pk):
		product = get_object_or_404(Product, id=pk)

		if product.created_by == request.user:
			return Response('Cannot purchase your own product')
		if not product.is_available:
			return Response('Product has already been purchased')
		
		product.purchase(request.user)
		return Response('Purchased')


class signupAPIView(APIView):

	def post(self, request):
		serializer = RegisterSerializer(data=request.data)
		
		serializer.is_valid(raise_exception=True)
		serializer.save()
		
		return Response(serializer.data)