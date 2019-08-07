# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.conf import settings
from django.views.generic import TemplateView


class DemoView(TemplateView):
    template_name = "demo/demo.html"

    def get_context_data(self, **kwargs):
        context = super(DemoView, self).get_context_data(**kwargs)
        context.update({
            'var1': settings.VAR1,
            'var2': settings.VAR2,
        })

        return context
