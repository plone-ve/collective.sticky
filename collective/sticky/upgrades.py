# -*- coding: utf-8 -*-

from Acquisition import aq_get
from Products.CMFCore.utils import getToolByName


def upgrade_to_two(context):
    context.runImportStepFromProfile('profile-collective.sticky:default',
                                     'plone.app.registry')
    catalog = getToolByName(context, 'portal_catalog')
    catalog.manage_clearIndex(['sticky_sort'])
    catalog.reindexIndex('sticky_sort', aq_get(context, 'REQUEST', None))
