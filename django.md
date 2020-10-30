# Django

## Commands

Load specific settings to Django `commands`

Option 1:

```shell
$ export DJANGO_SETTINGS_MODULE={{ module.to.django.settings }}
$ python manage.py {{ any command }}
```

Option 2:

```shell
$ DJANGO_SETTINGS_MODULE={{ module.to.django.settings }} python manage.py {{ any command }}
```

### Resources

- Relase notes
    - 2021-04-XX - [3.2.0 on dev branch](https://docs.djangoproject.com/en/dev/releases/3.2/)
    - 2020-11-02 - [3.1.3 on dev branch](https://docs.djangoproject.com/en/dev/releases/3.1.3/)
    - 2020-08-04 - [3.1.0 on dev branch](https://docs.djangoproject.com/en/dev/releases/3.1/)
    - 2020-11-02 - [3.0.11 on dev branch](https://docs.djangoproject.com/en/dev/releases/3.0.11/)
    - 2019-12-02 - [3.0.0 on dev branch](https://docs.djangoproject.com/en/dev/releases/3.0/)
        <details><summary>recommended version</summary>
        2020-10-17 - oldest supported Python version is 3.6 (oldest version doesn't reach End Of Line)
        </details>
    - 2020-11-02 - [2.2.17 on dev branch](https://docs.djangoproject.com/en/dev/releases/2.2.17/)
    - 2019-04-01 - [2.2.0 on dev branch](https://docs.djangoproject.com/en/dev/releases/2.2/)
    - 2019-12-02 - [2.1.15 on dev branch](https://docs.djangoproject.com/en/dev/releases/2.1.15/)
    - 2018-08-01 - [2.1.0 on dev branch](https://docs.djangoproject.com/en/dev/releases/2.1/)
    - 2019-02-13 - [2.0.13 on dev branch](https://docs.djangoproject.com/en/dev/releases/2.0.13/)
    - 2017-12-02 - [2.0.0 on dev branch](https://docs.djangoproject.com/en/dev/releases/2.0/)

- Extra tools:
    - [encode/django-rest-framework](https://github.com/encode/django-rest-framework) - Web APIs for Django.
    - [pydanny/cookiecutter-django](https://github.com/pydanny/cookiecutter-django) - Cookiecutter Django is a framework for jumpstarting production-ready Django projects quickly.
    - [jazzband/django-debug-toolbar](https://github.com/jazzband/django-debug-toolbar) - A configurable set of panels that display various debug information about the current request/response.
    - [pennersr/django-allauth](https://github.com/pennersr/django-allauth) - Integrated set of Django applications addressing authentication, registration, account management as well as 3rd part...
    - [django-extensions/django-extensions](https://github.com/django-extensions/django-extensions) - This is a repository for collecting global custom management extensions for the Django Framework.
    - [django/channels](https://github.com/django/channels) - Developer-friendly asynchrony for Django
    - [django-crispy-forms/django-crispy-forms](https://github.com/django-crispy-forms/django-crispy-forms) - The best way to have DRY Django forms. The app provides a tag and filter that lets you quickly render forms in a div …
    - [adamchainz/django-cors-headers](https://github.com/adamchainz/django-cors-headers) - Django app for handling the server headers required for Cross-Origin Resource Sharing (CORS)
    - [carltongibson/django-filter](https://github.com/carltongibson/django-filter) - A generic system for filtering Django QuerySets based on user selections
    - [graphql-python/graphene-django](https://github.com/graphql-python/graphene-django) - Integrate GraphQL into your Django project.
    - [django-haystack/django-haystack](https://github.com/django-haystack/django-haystack) - Modular search for Django
    - [jazzband/django-silk](https://github.com/jazzband/django-silk) - Silky smooth profiling for Django
    - [joke2k/django-environ](https://github.com/joke2k/django-environ) - Django-environ allows you to utilize 12factor inspired environment variables to configure your Django application.
    - [darklow/django-suit](https://github.com/darklow/django-suit) - Modern theme for Django admin interface
    - [jazzband/django-model-utils](https://github.com/jazzband/django-model-utils) - Django model mixins and utilities.
    - [groveco/django-sql-explorer](https://github.com/groveco/django-sql-explorer) - Easily share data across your company via SQL queries. From Grove Collab.
    - [jschneier/django-storages](https://github.com/jschneier/django-storages) - a project to provide a variety of storage backends in a single library.
    - [brack3t/django-braces](https://github.com/brack3t/django-braces) - Reusable, generic mixins for Django
    - [yourlabs/django-autocomplete-light](https://github.com/yourlabs/django-autocomplete-light) - A fresh approach to autocomplete implementations, specially for Django.
    - [celery/django-celery](https://github.com/celery/django-celery) - Old Celery integration project for Django
    - [rq/django-rq](https://github.com/rq/django-rq) - A simple app that provides django integration for RQ (Redis Queue)
    - [Koed00/django-q](https://github.com/Koed00/django-q) - A multiprocessing distributed task queue for Django

- Interesting repos:
    - [DjangoBlog](https://github.com/liangliangyy/DjangoBlog) - Django-based blog system

- YouTube:
    - Videos:
        - [Create a Twitter-like App with Python Django JavaScript and React. Full TUTORIAL](https://www.youtube.com/watch?v=f1R_bykXHGE)
        - [Django REST Framework Full Course For Beginners | Build REST API With Django](https://www.youtube.com/watch?v=B38aDwUpcFc)
        - [Python Django Tutorial 2020 - Full Course for Beginners](https://www.youtube.com/watch?v=JT80XhYJdBw)
    - Playlists:
        - Dennis Ivy - [Django (3.0) Crash Course Tutorials | Customer Management App](https://www.youtube.com/playlist?list=PL-51WBLyFTg2vW-_6XBoUpE7vpmoR3ztO)
        - Developer. pe - [Curso Django](https://www.youtube.com/playlist?list=PLMbRqrU_kvbTGg_oUKXyWi63Mo9Yoot9K)
        - CodingWithMitch - [Django Rest-framework](https://www.youtube.com/playlist?list=PLgCYzUzKIBE9Pi8wtx8g55fExDAPXBsbV)
        - Corey Schafer - [Django Tutorials](https://www.youtube.com/playlist?list=PL-osiE80TeTtoQCKZ03TU5fNfx2UY6U4p)
        - Tech With Tim - [Python Django Tutorials](https://www.youtube.com/playlist?list=PLzMcBGfZo4-kQkZp-j9PNyKq7Yw5VYjq9)
        - AlgoriSoft - [Curso de Python con Django de 0 a Máster | Español](https://www.youtube.com/playlist?list=PLxm9hnvxnn-j5ZDOgQS63UIBxQytPdCG7)
        - KeepCoding - [Cursos de programación - Curso Introducción a Python & Django](https://www.youtube.com/playlist?list=PLQpe1zyko1phY_8XwZOQSdoyKf9nv7kMl)

- Final Articles / Posts
    - [r/django/](https://www.reddit.com/r/django/)
    - [rnevius/rnevius.github.io - Django Request Response Cycle](https://github.com/rnevius/rnevius.github.io/blob/master/assets/django_request_response_cycle.pdf)
    - [testdrive.io - Django](https://testdriven.io/blog/topics/django/)
    - 2020-05-25 - [A tour of Django server setups](https://mattsegal.dev/django-prod-architectures.html) - [reddit](https://www.reddit.com/r/django/comments/gq8nil/a_tour_of_django_server_setups/)
    - 2020-03-10 - [A Guide to ASGI in Django 3.0 and its Performance](https://arunrocks.com/a-guide-to-asgi-in-django-30-and-its-performance/)
    - 2020-01-07 - [Learning Django - Beginner Mistakes I Made That You Can Avoid](https://www.reddit.com/r/django/comments/eld87j/learning_django_beginner_mistakes_i_made_that_you/)
    - 2019-12-21 - [Django web security checklist before deployment](https://web.archive.org/web/20200220012934/https://reversepython.net/lab/django-web-security-checklist-deployment/)
    - 2019-10-22 - [A Django REST framework view inheritance diagram](https://www.reddit.com/r/django/comments/dlk6v8/a_django_rest_framework_view_inheritance_diagram/) - [backup](https://i.imgur.com/ueoM3sy.png)
