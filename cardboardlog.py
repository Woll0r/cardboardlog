#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bottle import default_app, template, route, run, static_file
import sqlite3

@route('/')
@route('/log')
@route('/log/<limit:int>')
def log(limit=100):
    logdata = db_select("SELECT timestamp, name, message FROM cardboardlog ORDER BY timestamp DESC LIMIT " + str(limit))
    logcount = db_get_log_counts()
    output = template('loglist', data=logdata, count=logcount)
    return output

@route('/links')
@route('/links/<limit:int>')
def links(limit=100):
	linkdata = db_select("SELECT timestamp, name, url, title FROM cardboardlinks ORDER BY timestamp DESC LIMIT " + str(limit))
	linkcount = db_get_link_counts()
	output = template('linklist', data=linkdata, count=linkcount)
	return output

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='/home/wolfgang/cardboardenv/cardboardlog/static')
	
def db_get_link_counts():
    data = db_select("SELECT COUNT(url) FROM cardboardlinks")
    count = data[0][0]
    return count

def db_get_log_counts():
    data = db_select("SELECT COUNT(message) FROM cardboardlog")
    count = data[0][0]
    return count

def db_select(query):
    db = sqlite3.connect('/home/wolfgang/cardboardenv/cardboardbot/cardboardlog.db')
    c = db.cursor()
    c.execute(query)
    data = c.fetchall()
    c.close()
    return data

class StripPathMiddleware(object):
    '''
    Remove the trailing slash from a request
    '''
    def __init__(self, a):
        self.a = a
    def __call__(self, e, h):
        e['PATH_INFO'] = e['PATH_INFO'].rstrip('/')
        return self.a(e, h)

if __name__ == '__main__':
    run(app=StripPathMiddleware(app),
        server='python_server',
        host='0.0.0.0',
        port=8080)
else:
    os.chdir(os.path.dirname(file))
    application = default_app()