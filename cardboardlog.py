#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bottle import Bottle, template, route, run, static_file
import sqlite3

app = Bottle()

@app.route('/')
@app.route('/log')
def log():
    data = db_select("SELECT timestamp, name, message FROM cardboardlog ORDER BY timestamp DESC LIMIT 100")
    output = template('loglist', data=data)
    return output

@app.route('/links')
def links():
	data = db_select("SELECT timestamp, name, url, title FROM cardboardlinks ORDER BY timestamp DESC LIMIT 100")
	output = template('linklist', data=data)
	return output

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='/home/wolfgang/cardboardenv/cardboardlog/static')
	
def db_select(query):
    db = sqlite3.connect('/home/wolfgang/cardboardenv/cardboardbot/cardboardlog.db')
    c = db.cursor()
    c.execute(query)
    data = c.fetchall()
    c.close()
    return data

app.run(host="0.0.0.0", port=8080)
