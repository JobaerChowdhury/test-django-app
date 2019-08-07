from django.conf.urls import url

from .views import DemoView


urlpatterns = [
    url(r'^$', DemoView.as_view(), name="demo"),
]
