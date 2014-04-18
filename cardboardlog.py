#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bottle import Bottle, template, route, run, static_file
import sqlite3

app = Bottle()

@app.route('/')
@app.route('/log/<limit:int>')
def log(limit=100):
    logdata = db_select("SELECT timestamp, name, message FROM cardboardlog ORDER BY timestamp DESC LIMIT " + limit)
    logcount = db_get_log_counts()
    output = template('loglist', data=logdata, count=logcount)
    return output

@app.route('/links/<limit:int>')
def links(limit=100):
	linkdata = db_select("SELECT timestamp, name, url, title FROM cardboardlinks ORDER BY timestamp DESC LIMIT " + limit)
	linkcount = db_get_link_counts()
	output = template('linklist', data=linkdata, count=linkcount)
	return output

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='/home/wolfgang/cardboardenv/cardboardlog/static')
	
def db_get_link_counts():
    data = db_select("SELECT COUNT(url) FROM cardboardlinks")
    count = data[0][0]
    return count

def db_get_link_counts():
    data = db_select("SELECT COUNT(url) FROM cardboardlinks")
    count = data[0][0]
    return count

def db_select(query):
    db = sqlite3.connect('/home/wolfgang/cardboardenv/cardboardbot/cardboardlog.db')
    c = db.cursor()
    c.execute(query)
    data = c.fetchall()
    c.close()
    return data

app.run(host="0.0.0.0", port=8080)
