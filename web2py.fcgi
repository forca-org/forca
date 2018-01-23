#!/usr/bin/python2.5
import sys
from fcgi import WSGIServer
import gluon.main
application=gluon.main.wsgibase
#or
#application=gluon.main.wsgibase_with_logging
WSGIServer(application).run()
