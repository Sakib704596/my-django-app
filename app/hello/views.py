from django.http import HttpResponse

def index(request):
    return HttpResponse("<h1>Hello from Docker! 🐳</h1><p>Your Django app is running inside a container.</p>")