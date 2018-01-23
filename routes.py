routes_in=(('/forca/(?P<a>.*)','/\g<a>'),)
default_application = 'ForCA'    # ordinarily set in base routes.py
default_controller = 'default'  # ordinarily set in app-specific routes.py
default_function = 'index'      # ordinarily set in app-specific routes.py
routes_out=(('/(?P<a>.*)','/forca/\g<a>'),)
