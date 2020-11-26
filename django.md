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

Doesn't yet support Composite Primary Keys
- [Multi-Column Primary Key support](https://code.djangoproject.com/wiki/MultipleColumnPrimaryKeys)
- [Add support for multiple-column primary keys](https://code.djangoproject.com/ticket/373)

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

- Cheat sheets:
    - [LeCoupa/awesome-cheatsheets](https://github.com/LeCoupa/awesome-cheatsheets) - Awesome cheatsheets for popular programming languages, frameworks and development tools. They include everything you should know in one single file.
        - [backend/django](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/backend/django.py)

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
    - [modlinltd/django-advanced-filters](https://github.com/modlinltd/django-advanced-filters) - Add advanced filtering abilities to Django admin

- Interesting repos:
    - [DjangoBlog](https://github.com/liangliangyy/DjangoBlog) - Django-based blog system

- Reddit:
    - [Learning Django - Beginner Mistakes I Made That You Can Avoid](https://www.reddit.com/r/django/comments/eld87j/learning_django_beginner_mistakes_i_made_that_you/)
        - Official Documentation Vs Tutorials
        - Django Version
        - Using Git and GitHub
        - Using .gitignore File
        - Brush Up Your Front End Skills
        - Using Virtual Environment
        - Using Separate settings.py Files For Development & Production
        - Creating Custom User Models
        - Using Social logins
        - Designing your Models
        - Function Based Views Vs Class Based Views
        - Routing and URLs
        - Handling Static and Media files in Production
        - Handling Permissions For Different Users
        - Creating Custom Middlewares
        - Improving Security Of Website
        - Protecting Your Admin Interface
        - Protecting Secret Key and Other Critical Data
        - Making Responsive Websites
        - Writing Tests
        - Using REST APIs
        - Setting DEBUG=False Before Deployment
        - Deploying The Project
    - [Django in Production - From Zero To Hero.](https://www.reddit.com/r/django/comments/fcwoay/django_in_production_from_zero_to_hero/)
        - [YT playlist](https://www.youtube.com/playlist?list=PLlM3i4cwc8zBRQOGXuLrCLNfpVOuVLuwZ)
        - Part 1 - VPS up and running with secure SSH configuration and access in just 11 minutes.
        - Part 2 - Nginx theory, installation and configuration
        - Part 3 - a short introduction to Ansible and how it is useful for automation of Django deployments
        - Part 4 - install and configure DB manually and with Ansible
        - Part 5 - is the most important and most interesting - it focuses on configuring gunicorn + nginx on production VPS [<-- my favorite part :) ]
    - [A few months ago I asked the Django community here if anyone would be open to talk about their tech stack and lessons learned from using Django in production on a podcast I started. You crushed it! Here's some of the results](https://www.reddit.com/r/django/comments/ifrcd6/a_few_months_ago_i_asked_the_django_community/)
    - [Dockerizing Django with Postgres, Gunicorn, and Nginx](https://www.reddit.com/r/django/comments/h8u5cf/dockerizing_django_with_postgres_gunicorn_and/)
        - [post](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)
            ```bash
            # https://docs.python.org/3/using/cmdline.html

            # Prevents Python from writing pyc files to disc (equivalent to python -B option)
            PYTHONDONTWRITEBYTECODE 1

            # Prevents Python from buffering stdout and stderr (equivalent to python -u option)
            PYTHONUNBUFFERED 1
            ```
    - [Advanced Django Tutorials](https://www.reddit.com/r/django/comments/hwgrcb/advanced_django_tutorials/)
        - testing
        - caching
        - best practices
        - deployment
        - containerizing
        - securing
        - implementing Celery
    - 2020-06-20 - [Architecture diagram for Django application deployment and CI/CD pipeline using AWS Fargate, CDK and GitLab CI](https://www.reddit.com/r/django/comments/hcrdod/architecture_diagram_for_django_application/)
    - 2020-08-04 - [Django 3.1 release notes | Django documentation](https://www.reddit.com/r/django/comments/i3fjns/django_31_release_notes_django_documentation/)
        - Asynchronous views
        - Asynchronous middleware
        - Asynchronous tests and test client
        - JSONField for all supported database backends
        - Django now includes models.JSONField and forms.JSONField
        - Both fields support the use of custom JSON encoders and decoders
    - 2020-05-25 - [A tour of Django server setups](https://www.reddit.com/r/django/comments/gq8nil/a_tour_of_django_server_setups/) - [archive](https://web.archive.org/web/20201120042024/https://mattsegal.dev/django-prod-architectures.html) - [image](https://i.imgur.com/V1pZB5q.png)
    - 2020-03-12 - [Comprehensive Guide to ASGI in Django 3.0 and its Performance](https://www.reddit.com/r/django/comments/fhjpso/comprehensive_guide_to_asgi_in_django_30_and_its/)
        - [A Guide to ASGI in Django 3.0 and its Performance](https://arunrocks.com/a-guide-to-asgi-in-django-30-and-its-performance/)
        - Django 3.0 - ASGI Server
        - Django 3.1 - Async Views (see an example below)
        - Django 3.2/4.0 - Async ORM
    - 2020-01-02 - [Django web security checklist before deployment](https://www.reddit.com/r/django/comments/ej025x/django_web_security_checklist_before_deployment/) - [archive](https://web.archive.org/web/20200220012934/https://reversepython.net/lab/django-web-security-checklist-deployment/)
        - Checklist:
            - Deployment Checklist
            - The Mozilla Observatory
            - Cross site request forgery (CSRF) protection
            - Cross-site Scripting (XSS)
            - Django Admin Security
            - SSL Redirect
            - Content Security Policy (CSP)
            - HTTP Strict Transport Security
        - Related:
            - [FallibleInc/security-guide-for-developers](https://github.com/FallibleInc/security-guide-for-developers) - Security Guide for Developers
            - [trimstray/nginx-admins-handbook](https://github.com/trimstray/nginx-admins-handbook) - How to improve NGINX performance, security, and other important things.
            - [digitalocean/nginxconfig.io](https://github.com/digitalocean/nginxconfig.io) - NGINX config generator on steroids
            - [imthenachoman/How-To-Secure-A-Linux-Server](https://github.com/imthenachoman/How-To-Secure-A-Linux-Server)
            - [docker/docker-bench-security](https://github.com/docker/docker-bench-security) - The Docker Bench for Security is a script that checks for dozens of common best-practices around deploying Docker containers in production.
    - 2020-09-23 - [How to build a React application in a Django project (Part 4 of "Modern JavaScript for Django Developers")](https://www.reddit.com/r/django/comments/j1y4yc/how_to_build_a_react_application_in_a_django/)
        - Part 1: Organizing your Front-End Codebase in a Django Project
        - Part 2: A Crash Course in Modern JavaScript Tooling
        - Part 3: Integrating a Modern JavaScript Pipeline into a Django Application
        - Part 4: How to build a React application in a Django project
    - 2020-06-09 - [Django Cheat Sheet - Hope someone needs it!](https://www.reddit.com/r/django/comments/gzhfec/django_cheat_sheet_hope_someone_needs_it/)
        - Django: Create Project
        - Django: Template Inheritance Cheat Sheet
        - Install Django Rest Framework
        - Django: Shell Cheat Sheet
        - Django: Rest Framework Serialization Cheat Sheet
        - DjangoL Passing Data into Viet Cheat Sheet
        - Django: Rest Framework Views Cheat Sheet
        - Django: Building a Page Cheat Sheet
        - Working with Django Models
        - Install Django
    - 2020-11-08 - [A user story](https://www.reddit.com/r/django/comments/jqn34o/a_user_story/) - example of a test
    - 2020-08-17 - [Async Views in Django 3.1](https://www.reddit.com/r/django/comments/ibcz1h/async_views_in_django_31/)
        - 2020-09-22 - [Async Views in Django 3.1](https://testdriven.io/blog/django-async-views/)
    - 2020-10-15 - [A great Docker/Celery/Redis tutorial](https://www.reddit.com/r/django/comments/jc1arx/a_great_dockerceleryredis_tutorial/)
    - 2020-10-19 - [Fast full-text search with Django and Postgres](https://www.reddit.com/r/django/comments/je5ofk/fast_fulltext_search_with_django_and_postgres/)
    - 2020-10-10 - [A video about the server setup of a Django project in production and development.](https://www.reddit.com/r/django/comments/j8pk3c/a_video_about_the_server_setup_of_a_django/)
    - 2020-01-16 - [What public apps do you use with most/all of your Django projects?](https://www.reddit.com/r/django/comments/epooab/what_public_apps_do_you_use_with_mostall_of_your/)
    - 2020-10-24 - [Free Django Resources for Beginners](https://www.reddit.com/r/django/comments/jhb3tf/free_django_resources_for_beginners/)
    - 2020-11-04 - [Understand Django: User Authentication](https://www.reddit.com/r/django/comments/jnza1l/understand_django_user_authentication/) - [post](https://www.mattlayman.com/understand-django/user-authentication/) - [archive](https://web.archive.org/web/20201109165400/https://www.mattlayman.com/understand-django/user-authentication/)
    - 2020-10-23 - [Instagram runs on Django!! A Journey We All Can Learn From](https://www.reddit.com/r/django/comments/jgqo7w/instagram_runs_on_django_a_journey_we_all_can/)
    - 2020-11-16 - [[Showcase] Collaborative Code Editing using Django Channels](https://www.reddit.com/r/django/comments/jv29xt/showcase_collaborative_code_editing_using_django/)
    - 2020-11-13 - [What happens when Django receives multiple requests?](https://www.reddit.com/r/django/comments/jtdw85/what_happens_when_django_receives_multiple/)
    - 2020-11-02 - [Five Advanced Django Tips](https://www.reddit.com/r/django/comments/jmo82b/five_advanced_django_tips/)
        - Using Q Objects for Complex Queries
        - Optimize Database Calls with Prefetch Related and Select Related
        - Annotate Querysets to Fetch Specific Values
        - Use Prefetch Objects to Control Your Prefetch Related
        - Define Custom Query Sets and Model Managers for Code Reuse

- YouTube:
    - Channels
        - [Corey Schafer](https://www.youtube.com/c/Coreyms)
    - Videos:
        - [Create a Twitter-like App with Python Django JavaScript and React. Full TUTORIAL](https://www.youtube.com/watch?v=f1R_bykXHGE)
        - [Django REST Framework Full Course For Beginners | Build REST API With Django](https://www.youtube.com/watch?v=B38aDwUpcFc)
        - [Python Django Tutorial 2020 - Full Course for Beginners](https://www.youtube.com/watch?v=JT80XhYJdBw)
        - 2016-08-10 - [DjangoCon US 2016 - Django and React: Perfect Together by Jack McCloy](https://www.youtube.com/watch?v=zYHv6U86X0Y)
        - 2017-09-06 - [DjangoCon US 2017 - Write an API for Almost Anything... by Charlotte Mays](https://www.youtube.com/watch?v=-6tR5TffP0w)
        - 2018-11-08 - [DjangoCon US 2018 - Finally Understand Authentication in Django REST Framework by William S. Vincent](https://www.youtube.com/watch?v=pY-oje5b5Qk)
        - 2019-10-18 - [DjangoCon 2019 - Django REST Framework: Taking your API to the next level by Carlos Martinez](https://www.youtube.com/watch?v=695y8rdHsA4)
        - 2016-08-24 - [DjangoCon US 2016 - I Didn't Know Querysets Could do That by Charlie Guo](https://www.youtube.com/watch?v=5y7vU52jOiQ)
        - 2017-09-06 - [DjangoCon US 2017 - Type UWSGI; Press Enter; What Happens? by Philip James](https://www.youtube.com/watch?v=YoUZIzPGKT8)
        - 2019-10-18 - [DjangoCon 2019 - Creating a containerized Django + React + PostgreSQL... by Dan Taylor](https://www.youtube.com/watch?v=hwHRI59iGlw)
        - 2019-10-18 - [DjangoCon 2019 - Search From the Ground Up by William S. Vincent](https://www.youtube.com/watch?v=is3R8d420D4)
        - 2018-11-08 - [DjangoCon US 2018 - Building Workflows With Celery by Josue Balandrano Coronel](https://www.youtube.com/watch?v=8YLeWxLtVgo)
        - 2017-09-08 - [DjangoCon US 2017 - The Beauty of ViewSets in Django Rest Framework by Buddy Lindsey Jr.](https://www.youtube.com/watch?v=8yRvl4i6CNE)
        - 2017-09-08 - [DjangoCon US 2017 - Tasks: you gotta know how to run 'em... by Filipe Ximenes](https://www.youtube.com/watch?v=XjzyOyLbvN8)
        - 2017-09-08 - [DjangoCon US 2017 - Practical Unit Testing in Django by Wayne Merry](https://www.youtube.com/watch?v=Ue-a20-tKPI)
        - 2018-11-08 - [DjangoCon US 2018 - Django REST Framework: Moving Past the Tutorial to Production by Drew Winstel](https://www.youtube.com/watch?v=-9WniUBt0fo)
        - 2019-10-18 - [DjangoCon 2019 - Just Add Await: Retrofitting Async Into Django by Andrew Godwin](https://www.youtube.com/watch?v=d9BAUBEyFgM)
        - 2019-10-18 - [DjangoCon 2019 - Logging and Exception Handling for Django by Ryan Sullivan](https://www.youtube.com/watch?v=ziegOuE7M4A)
        - 2017-09-06 - [DjangoCon US 2017 - Keynote - Testing in Django by Ana Balica](https://www.youtube.com/watch?v=Zo5q48BG8A4)
        - 2016-08-10 - [DjangoCon US 2016 - Solving Problems With Django Forms by Kirt Gittens](https://www.youtube.com/watch?v=rsy0W-eBrQA)
        - 2018-11-08 - [DjangoCon US 2018 - Easier Classes: Python Classes Without All The Cruft by Trey Hunner](https://www.youtube.com/watch?v=epKegvx_Jws)
        - 2019-10-18 - [DjangoCon 2019 - Building effective Django queries with expressions by Vanessa Barreiros](https://www.youtube.com/watch?v=a-sfr6y_hY8)
        - 2017-09-07 - [DjangoCon US 2017 - Taking Django Distributed by Andrew Godwin](https://www.youtube.com/watch?v=gCNj8mMoq38)
        - 2018-11-08 - [DjangoCon US 2018 - Fundamentals of Kubernetes for Django developers by Graham Dumpleton](https://www.youtube.com/watch?v=kbarwyun-c4)
        - 2019-10-18 - [DjangoCon 2019 - Prepping Your Project for Production by Peter Baumgartner](https://www.youtube.com/watch?v=tssYpA6WiQM)
        - 2019-10-18 - [DjangoCon 2019 - Postgres Index types and where to find them by Louise Grandjonc](https://www.youtube.com/watch?v=ncwqtsjlSBE)
        - 2019-10-18 - [DjangoCon 2019 - Using Django as a Micro-Framework: Hacking on the HTTP handlers.. by Carlton Gibson](https://www.youtube.com/watch?v=w9cYEovduWI)
        - 2018-11-08 - [DjangoCon US 2018 - Containerless Django: Deploying without Docker by Peter Baumgartner](https://www.youtube.com/watch?v=Jzf8gTLN1To)
        - 2018-11-08 - [DjangoCon US 2018 - "Normalize until it hurts; denormalize until it works"... by Flávio Juvenal](https://www.youtube.com/watch?v=01Hm2-NAM3w)
        - 2017-09-08 - [DjangoCon US 2017 - The denormalized query engine design pattern by Simon WIllison](https://www.youtube.com/watch?v=NzcvewgqYog)
        - 2018-11-08 - [DjangoCon US 2018 - Code Review Skills for Pythonistas by Nina Zakharenko](https://www.youtube.com/watch?v=ZsT7nSRQ8S4)
        - 2018-11-08 - [DjangoCon US 2018 - BDD (Behavior Driven Development) Testing for Django Apps by Le Xiao](https://www.youtube.com/watch?v=k-pQt9SwZec)
        - 2017-09-07 - [DjangoCon US 2017 - Getting the most out of Django’s User Model by Julia M. Looney](https://www.youtube.com/watch?v=uLPZYuj7yTg)
        - 2016-08-14 - [DjangoCon US 2016 - Keynote: Architecting with Channels by Andrew Godwin](https://www.youtube.com/watch?v=mqV9cjcsbF4)
        - 2019-10-18 - [DjangoCon 2019 - Migrating legacy data to your Django project by Adolfo Fitoria](https://www.youtube.com/watch?v=2jVlPkOgjMs)
        - 2019-10-18 - [DjangoCon 2019 - Goodbye Print, Hello Debugger! by Nina Zakharenko](https://www.youtube.com/watch?v=y_dCT9TQtyQ)
        - 2019-10-18 - [DjangoCon 2019- Everything you need to know but were afraid to ask about Data Classes by Casey Faist](https://www.youtube.com/watch?v=mm9qAe6u-00)
        - 2018-11-08 - [DjangoCon US 2018 - Strategies for Zero Down Time, Frequent Deployments by Nick Humrich](https://www.youtube.com/watch?v=hulRKdSPUOc)
        - 2019-10-18 - [DjangoCon 2019 - Understanding Django authentication by Renato Oliveira](https://www.youtube.com/watch?v=zb_riMIp2Sw)
        - 2019-10-18 - [DjangoCon 2019 - Generic View? What is that and why would I use it? by Felipe Lee](https://www.youtube.com/watch?v=qmKowZNmkCo)
        - 2019-10-18 - [DjangoCon 2019 - The Unspeakable Horror of Discovering You Didn't Write Tests by Melanie Crutchfield](https://www.youtube.com/watch?v=wvrr9-UUBn0)
        - 2019-10-18 - [DjangoCon 2019 - Prefetching for Fun and Profit by Mike Hansen](https://www.youtube.com/watch?v=QYDixnGetTI)
        - 2018-11-08 - [DjangoCon US 2018 - "State of Django" Panel by Simon Willison](https://www.youtube.com/watch?v=TrAFQW7Wza0)
        - 2020-04-29 - [Optimize Python & Django apps with Postgres superpowers – Louise Grandjonc – Sponsor Workshop](https://www.youtube.com/watch?v=dyBLGjCQJHs)
        - 2020-04-29 - [Tutorial: Katie McLaughlin - Deploying Django on Serverless Infrastructure](https://www.youtube.com/watch?v=oYy9_4fm56o)
        - 2019-05-05 - [Aaron Gee-Clough - Django Channels in practice - PyCon 2019](https://www.youtube.com/watch?v=j6IOuD5WD8c)
        - 2019-05-05 - [Jacob Kaplan-Moss - Assets in Django without losing your hair - PyCon 2019](https://www.youtube.com/watch?v=E613X3RBegI)
        - 2019-05-04 - [Jacinda Shelly - Hands-On Web Application Security with Django - PyCon 2019](https://www.youtube.com/watch?v=8W4MGggwgfM)
        - 2018-05-12 - [Shauna Gordon-McKeon - Beyond Django Basics - PyCon 2018](https://www.youtube.com/watch?v=Fzlg95lrILk)
        - 2018-05-10 - [Harry Percival - Introduction to TDD with Django - PyCon 2018](https://www.youtube.com/watch?v=_rLPDxpXIFc)
        - 2018-05-12 - [Harry Percival - Intermediate testing with Django: Outside-in TDD and Mocking effectively](https://www.youtube.com/watch?v=tFalO9KdCDM)
        - 2018-05-12 - [Andrew Godwin - Taking Django Async - PyCon 2018](https://www.youtube.com/watch?v=-7taKQnndfo)
        - 2018-05-10 - [Philip James - API-Driven Django - PyCon 2018](https://www.youtube.com/watch?v=w0xgJ5C9Be8&list=TLPQMjYxMTIwMjBvYD_diYUS9g&index=5)
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
    - [testdrive.io - Django](https://testdriven.io/blog/topics/django/) (intermediate / advanced)
        - [Asynchronous Tasks with Django and Celery](https://testdriven.io/blog/django-and-celery/)
    - [How to get Django and ReactJS to work together?](https://stackoverflow.com/questions/41867055/how-to-get-django-and-reactjs-to-work-together)
    - 2020-07-24 - [Is Django too slow?](https://mattsegal.dev/is-django-too-slow.html) - [archive](https://web.archive.org/web/20201022063130/https://mattsegal.dev/is-django-too-slow.html)
    - 2020-05-25 - [A tour of Django server setups](https://mattsegal.dev/django-prod-architectures.html) - [reddit](https://www.reddit.com/r/django/comments/gq8nil/a_tour_of_django_server_setups/)
    - 2020-03-10 - [A Guide to ASGI in Django 3.0 and its Performance](https://arunrocks.com/a-guide-to-asgi-in-django-30-and-its-performance/)
    - 2020-01-07 - [Learning Django - Beginner Mistakes I Made That You Can Avoid](https://www.reddit.com/r/django/comments/eld87j/learning_django_beginner_mistakes_i_made_that_you/)
    - 2019-12-21 - [Django web security checklist before deployment](https://web.archive.org/web/20200220012934/https://reversepython.net/lab/django-web-security-checklist-deployment/)
    - 2019-10-22 - [A Django REST framework view inheritance diagram](https://www.reddit.com/r/django/comments/dlk6v8/a_django_rest_framework_view_inheritance_diagram/) - [backup](https://i.imgur.com/ueoM3sy.png)
