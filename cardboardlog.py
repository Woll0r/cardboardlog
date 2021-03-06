#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess

import bottle
import os
from modules import cardboarddata


dbPath = '/home/wolfgang/cardboardenv/cardboardbot/cardboardlog.db'
staticRoot = '/home/wolfgang/cardboardenv/cardboardlog/static'

os.chdir(os.path.dirname(os.path.abspath(__file__)))
app = application = bottle.Bottle()

db = cardboarddata.CardboardData(dbPath)


@app.route('/hook', method='POST')
def hook():
    data = bottle.request.json
    if data is None:
        bottle.abort(400, "Didn't receive proper input.")
    if bottle.request.get_header('X-Github-Event') is None:
        bottle.abort(400, "You're not someone I want to talk to.")
    print "New commit detected by {} with message {}".format(data['commits'][0]['author']['name'],
                                                             data['commits'][0]['message'])

    proc = subprocess.Popen(['sh', 'hook.sh'])

    return 'OK!'


@app.route('/')
def index():
    logs = db.get_messages(5)
    links = db.get_links(5)
    messagecount = db.get_log_counts()
    linkscount = db.get_link_counts()
    cardboardbotmessagecount = db.get_log_counts(jid='cardboardbot@friendshipismagicsquad.com')
    linkspercentage = "{0:.2f}".format((linkscount / float(messagecount)) * 100)
    output = bottle.template('index',
                             logs=logs,
                             links=links,
                             messagecount=messagecount,
                             linkcount=linkscount,
                             cardboardbotmessagecount=cardboardbotmessagecount,
                             linkpercentage=linkspercentage)
    return output


@app.route('/log')
@app.route('/log', method='POST')
def log():
    emptydata = False
    if bottle.request.params.hours.isdigit():
        hours = int(bottle.request.params.hours)
    else:
        hours = 8
    if not bottle.request.params.user:
        user = None
    elif bottle.request.params.user == '-':
        user = None
    else:
        user = bottle.request.params.user
    # print("hours: {}".format(hours))
    # print("user: {}".format(user))
    data = db.get_messages2(hours=hours, user=user)
    if len(data) == 0:
        data = db.get_messages(user=user)
        emptydata = True
    nicks = db.get_users()
    output = bottle.template('logs', data=data, nicks=nicks, emptydata=emptydata)
    return output


@app.route('/links')
@app.route('/links', method='POST')
def links():
    emptydata = False
    if bottle.request.params.hours.isdigit():
        hours = int(bottle.request.params.hours)
    else:
        hours = 8
    if not bottle.request.params.user:
        user = None
    elif bottle.request.params.user == '-':
        user = None
    else:
        user = bottle.request.params.user
    if not bottle.request.params.domain:
        domain = None
    elif bottle.request.params.domain == '-':
        domain = None
    else:
        domain = bottle.request.params.domain
    # print("hours: {}".format(hours))
    # print("user: {}".format(user))
    # print("domain: {}".format(domain))
    data = db.get_links2(hours=hours, user=user, domain=domain)
    if len(data) == 0:
        data = db.get_links(user=user, domain=domain)
        emptydata = True
    nicks = db.get_users()
    domains = db.get_domains()
    output = bottle.template('links', data=data, nicks=nicks, domains=domains, emptydata=emptydata)
    return output


# @app.route('/log')
# @app.route('/log/<limit:int>')
# def log(limit=20):
#    page = '/logdata/' + str(limit)
#    output = bottle.template('refresh_page', title='CardboardBot Logs', page=page, refreshrate=10000)
#    return output


# @app.route('/links')
# @app.route('/links/<limit:int>')
# def links(limit=20):
#    page = '/linksdata/' + str(limit)
#    output = bottle.template('refresh_page', title='CardboardBot Links', page=page, refreshrate=60000)
#    return output


@app.route('/stats')
def stats():
    messagecount = db.get_log_counts()
    linkscount = db.get_link_counts()
    cardboarduser = db.get_user_by_jid(user='cardboardbot@friendshipismagicsquad.com')[0]
    cardboardbotmessagecount = db.get_log_counts(user=cardboarduser)
    messages = db.get_users_by_messages(limit=True)
    links = db.get_users_by_links(limit=True)
    linkpercentage = "{0:.2f}".format((linkscount / float(messagecount)) * 100)
    messagelinkratio = db.get_users_by_message_link_ratio(limit=True)
    domains = db.get_domains_by_links(limit=True)
    output = bottle.template('stats',
                             messagecount=messagecount,
                             linkcount=linkscount,
                             cardboardbotmessagecount=cardboardbotmessagecount,
                             messages=messages,
                             links=links,
                             linkpercentage=linkpercentage,
                             messagelinkratio=messagelinkratio,
                             domains=domains)
    return output


@app.route('/stats/messages')
def stats_messages():
    messagecount = db.get_log_counts()
    messages = db.get_users_by_messages()
    output = bottle.template('messagestats', messages=messages, messagecount=messagecount)
    return output


@app.route('/stats/links')
def stats_links():
    links = db.get_users_by_links()
    linkcount = db.get_link_counts()
    output = bottle.template('linkstats', links=links, linkcount=linkcount)
    return output


@app.route('/stats/ratio')
def stats_ratio():
    messagelinkratio = db.get_users_by_message_link_ratio()
    output = bottle.template('ratiostats', messagelinkratio=messagelinkratio)
    return output


@app.route('/stats/domains')
def stats_domains():
    domains = db.get_domains_by_links()
    linkcount = db.get_link_counts()
    output = bottle.template('domainsstats', domains=domains, linkcount=linkcount)
    return output


@app.route('/stats/user')
def stats_user():
    users = db.get_users()
    output = bottle.template('userstatsselect', users=users)
    return output


@app.route('/stats/user/<user>')
def stats_user(user=None):
    nick = db.get_user(user)
    linkcount = db.get_link_counts(user)
    messagecount = db.get_log_counts(user)
    domains = db.get_domains_by_links(limit=False, user=user)
    output = bottle.template('userstats',
                             nick=nick,
                             linkcount=linkcount,
                             messagecount=messagecount,
                             domains=domains,
                             user=user)
    return output


# @app.route('/logdata/<limit:int>')
# def logdata(limit=20):
#    logdata = db.get_messages(limit)
#    output = bottle.template('logdata', data=logdata)
#    return output


# @app.route('/linksdata/<limit:int>')
# def linksdata(limit=20):
#    linkdata = db.get_links(limit)
#    output = bottle.template('linkdata', data=linkdata)
#    return output


@app.route('/statsdata')
def statsdata():
    messages = db.get_users_by_messages(limit=True)
    links = db.get_users_by_links(limit=True)
    ratio = db.get_users_by_message_link_ratio(limit=True)
    domains = db.get_domains_by_links(limit=True)
    hours = db.get_hourstats()
    data = dict(messages=messages, links=links, ratio=ratio, domains=domains, hours=hours)
    return data


@app.route('/statsdata/messages')
def statsdata_messages():
    messages = db.get_users_by_messages(limit=True)
    data = dict(messages=messages)
    return data


@app.route('/statsdata/links')
def statsdata_links():
    links = db.get_users_by_links(limit=True)
    data = dict(links=links)
    return data


@app.route('/statsdata/ratio')
def statsdata_ratio():
    ratio = db.get_users_by_message_link_ratio(limit=True)
    data = dict(ratio=ratio)
    return data


@app.route('/statsdata/domains')
def statsdata_domains():
    domains = db.get_domains_by_links(limit=True)
    data = dict(domains=domains)
    return data


@app.route('/statsdata/hours')
def statsdata_hours():
    hours = db.get_hourstats()
    data = dict(hours=hours)
    return data


@app.route('/statsdata/user/<user>')
def statsdata_user(user):
    domains = db.get_domains_by_links(user=user, limit=True)
    hours = db.get_hourstats(user=user)
    data = dict(domains=domains, hours=hours)
    return data


@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root=staticRoot)


if __name__ == '__main__':
    bottle.run(host='0.0.0.0')

