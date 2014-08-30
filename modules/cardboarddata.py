#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sqlite3

class CardboardData():
    def __init__(self, dbpath):
        self.dbpath=dbpath

    def get_users(self):
        data = db_select("SELECT jid, nick FROM cardboardnick;")
        return data
        
    def get_messages(self, limit=100):
        data = db_select("SELECT l.timestamp, n.nick, l.message FROM cardboardlog l, cardboardnick n WHERE l.name = n.jid ORDER BY l.timestamp DESC, l.id DESC LIMIT " + str(limit))
        return data
        
    def get_links(self, limit=100):
        data = db_select("SELECT l.timestamp, n.nick, l.url, l.title FROM cardboardlinks l, cardboardnick n WHERE l.name = n.jid ORDER BY l.timestamp DESC, l.id DESC LIMIT " + str(limit))
        return data

    def get_users_by_messages(self, limit=False):
        if limit:
            data = db_select("SELECT n.nick, COUNT(l.message) AS count FROM cardboardlog l, cardboardnick n WHERE l.name = n.jid GROUP BY l.name ORDER BY count DESC LIMIT 10")
        else:
            data = db_select("SELECT n.nick, COUNT(l.message) AS count FROM cardboardlog l, cardboardnick n WHERE l.name = n.jid GROUP BY l.name ORDER BY count DESC")
        return data

    def get_users_by_links(self, limit=False):
        if limit:
            data = db_select("SELECT n.nick, COUNT(l.url) AS count FROM cardboardlinks l, cardboardnick n WHERE l.name = n.jid GROUP BY l.name ORDER BY count DESC LIMIT 10")
        else:
            data = db_select("SELECT n.nick, COUNT(l.url) AS count FROM cardboardlinks l, cardboardnick n WHERE l.name = n.jid GROUP BY l.name ORDER BY count DESC")
        return data

    def get_domains_by_links(self, limit=False, user=None):
        query = "SELECT domain, count(domain) AS count FROM cardboardlinks"
        param = None
        if user:
            query = query + " WHERE user=?"
            param = (user, )
        query = query + " GROUP BY domain ORDER BY count DESC"
        if limit:
            query = query + " LIMIT 10")
        data = db_select(query, param)
        return data

    def get_users_by_message_link_ratio(self, limit=False):
        query = "SELECT n.nick, ((SELECT COUNT(url) FROM cardboardlinks WHERE cardboardlinks.name = l.name) / CAST(COUNT(message) AS REAL)) * 100 AS ratio FROM cardboardlog l, cardboardnick n WHERE l.name = n.jid AND l.name IN (SELECT DISTINCT name FROM cardboardlinks) GROUP BY l.name ORDER BY ratio DESC"
        if limit:
            query = query + " LIMIT 10"
        data = db_select(query)
        return data
        
    def get_link_counts(self, user=None):
        query = "SELECT COUNT(url) FROM cardboardlinks"
        param = None
        if user:
            query = query + " WHERE name=?"
            param = (user, )
        data = db_select(query, param)
        count = data[0][0]
        return count

    def get_log_counts(self, user=None):
        query = "SELECT COUNT(message) FROM cardboardlog"
        param=None
        if user:
            query = query + " WHERE name=?"
            param = (user, )
        data = db_select(query, param)
        count = data[0][0]
        return count
        
    def get_nick(self, user=None):
        if not user:
            return None
        query = "SELECT nick FROM cardboardnick WHERE jid=?"
        param = (user, )
        data = db_select(query, param)
        return data[0][0]
        
    def select(self, query, param=None):
        db = sqlite3.connect('/home/wolfgang/cardboardenv/cardboardbot/cardboardlog.db')
        c = db.cursor()
        if param:
            c.execute(query, param)
        else:
            c.execute(query)
        data = c.fetchall()
        c.close()
        return data