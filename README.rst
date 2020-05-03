Introduction
============

Adds a "sticky" checkbox to Plone_ news items and events so they can be marked as sticky.
Sticky items will appear at the top of collections that use the ``sticky_summary_view`` layout.


Translations
============

This product has been translated into

- French.

- Spanish.

You can contribute for any message missing or other new languages, join us at 
`Plone Collective Team <https://www.transifex.com/plone/plone-collective/>`_ 
into *Transifex.net* service with all world Plone translators community.


Installation
============

To install it in your buildout, just add ``collective.sticky`` to your egg
list, like this: ::

    [buildout]

    ...

    eggs =
        collective.sticky


and then running ``bin/buildout``


To install it in Plone, use the Addons control panel, select
``collective.sticky`` Product and install it.


Tests status
============

This add-on is tested using Travis CI. The current status of the add-on is:

.. image:: https://img.shields.io/travis/collective/collective.sticky/master.svg
    :target: https://travis-ci.org/collective/collective.sticky

.. image:: http://img.shields.io/pypi/v/collective.sticky.svg
   :target: https://pypi.org/project/collective.sticky


Contribute
==========

Have an idea? Found a bug? Let us know by `opening a ticket`_.

- Issue Tracker: https://github.com/collective/collective.sticky/issues
- Source Code: https://github.com/collective/collective.sticky


License
=======

The project is licensed under the GPLv2.

.. _Plone: https://plone.org/
.. _`opening a ticket`: https://github.com/collective/collective.sticky/issues

