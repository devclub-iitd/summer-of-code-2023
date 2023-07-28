from django.contrib.auth.models import User
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework_simplejwt.tokens import RefreshToken
from .models import Product
from .serializers import ProductSerializer, UserSerializer


def create_response(data=None, error=None, message=None, status_code=status.HTTP_200_OK):
    response_data = {}

    if data is not None:
        response_data['data'] = data

    if error is not None:
        response_data['error'] = error
        # Use error message as the default value for message
        response_data['message'] = message or 'error'
    elif message is not None:
        response_data['message'] = message

    return Response(response_data, status=status_code)


@api_view(['GET'])
@permission_classes([IsAuthenticatedOrReadOnly])
def get_all_products(request):
    if request.method == 'GET':
        products = Product.objects.all()
        serializer = ProductSerializer(products, many=True)
        return create_response(data=serializer.data, message='Products retrieved successfully.')


@api_view(['GET'])
@permission_classes([IsAuthenticatedOrReadOnly])
def get_product(request, product_id):
    if request.method == 'GET':
        try:
            product = Product.objects.get(pk=product_id)
            serializer = ProductSerializer(product)
            return create_response(data=serializer.data, message='Product retrieved successfully.')
        except Product.DoesNotExist:
            return create_response(
                error='Product not found.',
                status_code=status.HTTP_404_NOT_FOUND
            )


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def add_product(request):
    if request.method == 'POST':
        serializer = ProductSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return create_response(
                data=serializer.data,
                message='Product added successfully.',
                status_code=status.HTTP_201_CREATED
            )
        return create_response(
            error=serializer.errors,
            status_code=status.HTTP_400_BAD_REQUEST
        )


@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete_product(request, product_id):
    if request.method == 'DELETE':
        try:
            product = Product.objects.get(pk=product_id)

            # Check if the authenticated user is the same as the user who created the product
            if request.user != product.user:
                return create_response(
                    error='You are not allowed to delete this product.',
                    status_code=status.HTTP_403_FORBIDDEN
                )

            product.delete()
            return create_response(
                message='Product deleted successfully.',
                status_code=status.HTTP_204_NO_CONTENT
            )
        except Product.DoesNotExist:
            return create_response(
                error='Product not found.',
                status_code=status.HTTP_404_NOT_FOUND
            )


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def purchase_product(request, product_id):
    try:
        product = Product.objects.get(pk=product_id)
        user = request.user

        if product.user == user:
            return create_response(
                error='You cannot purchase your own product.',
                status_code=status.HTTP_400_BAD_REQUEST
            )

        message = product.purchase(user)
        return create_response(
            message=message,
            data={'product_id': product_id},
            status_code=status.HTTP_200_OK
        )
    except Product.DoesNotExist:
        return create_response(
            error='Product not found.',
            status_code=status.HTTP_404_NOT_FOUND
        )


@api_view(['POST'])
def signup(request):
    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return create_response(
            data=serializer.data,
            message='User registered successfully.',
            status_code=status.HTTP_201_CREATED
        )
    return create_response(
        error=serializer.errors,
        status_code=status.HTTP_400_BAD_REQUEST
    )
