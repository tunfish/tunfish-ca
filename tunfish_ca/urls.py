from django.urls import path

from tunfish_ca import views


urlpatterns = [
    path('issuer/<hex:serial>.pem', views.GenericCAIssuersViewPEM.as_view(), name='issuer_by_serial'),
    path('issuer/<str:ca_name>.pem', views.GenericCAIssuersViewPEM.as_view(), name='issuer_by_name'),
    path('pki/<str:ca_name>/autosign', views.PKIAutoSign.as_view(), name='autosign'),
]
