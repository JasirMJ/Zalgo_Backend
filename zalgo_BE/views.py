from django.http import HttpResponse


def index(request):
    return HttpResponse(
        'Zalgo API End Point'
    )