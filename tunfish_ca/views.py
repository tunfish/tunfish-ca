from cryptography.hazmat.primitives.serialization import Encoding
from django.http.response import HttpResponse
from django.views.generic.base import View
from django_ca.models import CertificateAuthority


class GenericCAIssuersViewPEM(View):
    def get(self, request, serial):
        ca = CertificateAuthority.objects.get(serial=serial)
        data = ca.x509.public_bytes(encoding=Encoding.PEM)
        return HttpResponse(data, content_type='application/x-pem-file')
