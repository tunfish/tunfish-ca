from django.urls import path

from tunfish_ca import views


urlpatterns = [
    path('issuer/<hex:serial>.pem', views.GenericCAIssuersViewPEM.as_view(), name='issuer'),
]
