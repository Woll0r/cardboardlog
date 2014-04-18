#!/usr/bin/env python
# -*- coding: utf-8 -*-

import bottle
import sqlite3

os.chdir(os.path.dirname(file))
app = application = bottle.Bottle()

@app.route('/')
@app.route('/log')
@app.route('/log/<limit:int>')
def log(limit=100):
    logdata = db_select("SELECT timestamp, name, message FROM cardboardlog ORDER BY timestamp DESC LIMIT " + str(limit))
    logcount = db_get_log_counts()
    output = bottle.template('loglist', data=logdata, count=logcount)
    return output

@app.route('/links')
@app.route('/links/<limit:int>')
def links(limit=100):
	linkdata = db_select("SELECT timestamp, name, url, title FROM cardboardlinks ORDER BY timestamp DESC LIMIT " + str(limit))
	linkcount = db_get_link_counts()
	output = bottle.template('linklist', data=linkdata, count=linkcount)
	return output

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root='/home/wolfgang/cardboardenv/cardboardlog/static')
	
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
# run(host='0.0.0.0')


