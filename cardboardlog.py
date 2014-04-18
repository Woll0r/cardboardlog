#!/usr/bin/env python
# -*- coding: utf-8 -*-

import bottle
import sqlite3

app = bottle.Bottle()

@app.route('/')
@app.route('/log')
def log():
    data = db_select("SELECT timestamp, name, message FROM cardboardlog ORDER BY timestamp DESC LIMIT 100")
    output = app.template('loglist', rows=data)
    return output

@app.route('/links')
def links():
	data = db_select("SELECT timestamp, name, url, title FROM cardboardlinks ORDER BY timestamp DESC LIMIT 100")
	output = app.template('linklist', rows=data)
	return output
	
def db_select(query):
    db = sqlite3.connect('/home/wolfgang/cardboardenv/cardboardbot/cardboardlog.db')
    c = db.cursor()
    c.execute(query)
    data = c.fetchall()
    c.close()
    return data

app.run()
