#!/usr/bin/env python
# -*- coding: utf-8 -*-

import bottle
import sqlite3
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))
app = application = bottle.Bottle()

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

@app.route('/')
@app.route('/stats')
def stats():
    messages = db_select("SELECT name, COUNT(message) AS count FROM cardboardlog GROUP BY name ORDER BY count DESC LIMIT 10")
    links = db_select("SELECT name, COUNT(url) AS count FROM cardboardlinks GROUP BY name ORDER BY count DESC LIMIT 10")
    messagelinkratio = db_select("SELECT name, ((SELECT COUNT(url) FROM cardboardlinks WHERE cardboardlinks.name = cardboardlog.name) / CAST(COUNT(message) AS REAL)) * 100 AS ratio FROM cardboardlog WHERE name IN (SELECT DISTINCT name FROM cardboardlinks) GROUP BY name ORDER BY ratio DESC LIMIT 10")
    messagecount = db_get_log_counts()
    linkscount = db_get_link_counts()
    linkpercentage = "{0:.2f}".format((linkscount/float(messagecount))*100)
    output = bottle.template('statistics', messagecount=messagecount, linkcount=linkscount, mostmessages=messages, mostlinks=links, linkpercentage=linkpercentage, messagelinkratio=messagelinkratio)
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

if __name__ == '__main__':
    bottle.run(host='0.0.0.0')


