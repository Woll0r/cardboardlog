#!/usr/bin/env python
# -*- coding: utf-8 -*-

import bottle
import sqlite3
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))
app = application = bottle.Bottle()

@app.route('/')
def index():
    output = bottle.template('main_page', title='CardboardBot', page='/indexdata', refreshrate=300000)
    return output

@app.route('/log')
@app.route('/log/<limit:int>')
def log(limit=100):
    page = '/logdata/' + str(limit)
    output = bottle.template('main_page', title='CardboardBot Logs', page=page, refreshrate=10000)
    return output
    
@app.route('/links')
@app.route('/links/<limit:int>')
def links(limit=100):
    page = '/linksdata/' + str(limit)
    output = bottle.template('main_page', title='CardboardBot Links', page=page, refreshrate=60000)
    return output

@app.route('/stats')
def stats():
    output = bottle.template('main_page', title='CardboardBot Stats', page='/statsdata', refreshrate=300000)
    return output

@app.route('/indexdata')
def indexdata():
    logs = db_get_messages(5)
    links = db_get_links(5)
    messagecount = db_get_log_counts()
    linkscount = db_get_link_counts()
    cardboardbotmessagecount = db_get_log_counts_by_self()
    linkspercentage = "{0:.2f}".format((linkscount/float(messagecount))*100)
    output = bottle.template('indexdata', logs=logs, links=links, messagecount=messagecount, linkcount=linkscount, cardboardbotmessagecount=cardboardbotmessagecount, linkpercentage=linkspercentage)
    return output

@app.route('/logdata/<limit:int>')
def logdata(limit=100):
    logdata = db_get_messages(limit)
    output = bottle.template('logdata', data=logdata)
    return output

@app.route('/linksdata/<limit:int>')
def linksdata(limit=100):
    linkdata = db_get_links(limit)
    output = bottle.template('linkdata', data=linkdata)
    return output

@app.route('/statsdata')
def statsdata():
    messagecount = db_get_log_counts()
    linkscount = db_get_link_counts()
    cardboardbotmessagecount = db_get_log_counts_by_self()
    messages = db_get_top_users_by_messages()
    links = db_get_top_users_by_links()
    linkpercentage = "{0:.2f}".format((linkscount/float(messagecount))*100)
    messagelinkratio = db_get_top_users_by_message_link_ratio()
    output = bottle.template('statsdata', messagecount=messagecount, linkcount=linkscount, cardboardbotmessagecount=cardboardbotmessagecount, mostmessages=messages, mostlinks=links, linkpercentage=linkpercentage, messagelinkratio=messagelinkratio)
    return output

@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root='/home/wolfgang/cardboardenv/cardboardlog/static')
    
def db_get_messages(limit=100):
    data = db_select("SELECT l.timestamp, n.nick, l.message FROM cardboardlog l, cardboardnick n WHERE l.name = n.jid ORDER BY l.timestamp DESC, l.id DESC LIMIT " + str(limit))
    return data
    
def db_get_links(limit=100):
    data = db_select("SELECT l.timestamp, n.nick, l.url, l.title FROM cardboardlinks l, cardboardnick n WHERE l.name = n.jid ORDER BY l.timestamp DESC, l.id DESC LIMIT " + str(limit))
    return data

def db_get_top_users_by_messages():
    data = db_select("SELECT n.nick, COUNT(l.message) AS count FROM cardboardlog l, cardboardnick n WHERE l.name = n.nick GROUP BY l.name ORDER BY count DESC LIMIT 5")
    return data

def db_get_top_users_by_links():
    data = db_select("SELECT n.nick, COUNT(l.url) AS count FROM cardboardlinks l, cardboardnick n WHERE l.name = n.nick GROUP BY l.name ORDER BY count DESC LIMIT 5")
    return data

def db_get_log_counts_by_self():
    data = db_select("SELECT COUNT(message) FROM cardboardlog WHERE name = 'cardboardbot@friendshipismagicsquad.com'")
    count = data[0][0]
    return count

def db_get_top_users_by_message_link_ratio():
    data = db_select("SELECT n.nick, ((SELECT COUNT(url) FROM cardboardlinks WHERE cardboardlinks.name = l.name) / CAST(COUNT(message) AS REAL)) * 100 AS ratio FROM cardboardlog l, cardboardnick n WHERE l.name = n.nick AND l.name IN (SELECT DISTINCT name FROM cardboardlinks) GROUP BY l.name ORDER BY ratio DESC LIMIT 5")
    return data
    
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


