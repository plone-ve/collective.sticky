# -*- coding: utf-8 -*-

from collective.sticky import _
from plone.app.contenttypes.interfaces import INewsItem, IEvent
from plone.autoform import directives as form
from plone.autoform.interfaces import IFormFieldProvider
from plone.indexer import indexer
from plone.supermodel import directives
from plone.supermodel import model
from z3c.form.browser.checkbox import SingleCheckBoxFieldWidget
from zope import schema
from zope.interface import provider


@provider(IFormFieldProvider)
class ISticky(model.Schema):
    """Add boolean field witch check if obj is sticky."""

    directives.fieldset(
        'categorization',
        label=_(u'Sticky'),
        fields=('sticky',),
    )

    sticky = schema.Bool(
        title=_(u'Sticky'),
        description=_(u'Should this page be "sticky" and appear at the top of sticky-aware collections?'),
        required=False,
        default=False,
    )
    form.widget('sticky', SingleCheckBoxFieldWidget)


@indexer(INewsItem)
def sticky_sort_news(context):
    date = getattr(context, 'effectiveDate', None)
    if date is None:
        date = getattr(context, 'creation_date', None)
    return (getattr(context, 'sticky', None), date.timeTime())


@indexer(INewsItem)
def is_sticky_news(context):
    if not ISticky.providedBy(context):
        return
    return getattr(context, 'sticky', None)


@indexer(IEvent)
def sticky_sort_event(context):
    date = getattr(context, 'start_date', None)
    return (getattr(context, 'sticky', None), date.timeTime())


@indexer(IEvent)
def is_sticky_event(context):
    if not ISticky.providedBy(context):
        return
    return getattr(context, 'sticky', None)
