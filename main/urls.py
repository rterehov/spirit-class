# coding: utf-8

from django.conf import settings
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.views.generic.base import RedirectView
from django.core.urlresolvers import reverse_lazy


admin.autodiscover()


urlpatterns = patterns('',
    # url(r'^$',          RedirectView.as_view(
    #                         url=reverse_lazy('spirit:index'),
    #                         permanent=False),
    #                         name='index'
    #                     ),

    url(r'^board/',     include('spirit.urls')),
    url(r'^admin/',     include(admin.site.urls)),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
            {'document_root': settings.MEDIA_ROOT}),
        url(r'^static/(?P<path>.*)$', 'django.views.static.serve',
            {'document_root': settings.STATIC_ROOT}),
    )
