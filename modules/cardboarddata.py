#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sqlite3
import time


class CardboardData():
    def __init__(self, dbpath):
        self.dbpath = dbpath

    def get_hourstats(self, user=None):
        query = "SELECT strftime('%H', l.timestamp, 'unixepoch') AS hour, COUNT(l.message) AS number " \
                "FROM cardboardlog l, cardboardnick n WHERE l.name = n.jid"
        param = ()
        if user is not None:
            query += " AND n.id = ?"
            param += (user, )
        query += " GROUP BY hour;"
        data = self.select(query, param)
        return data

    def get_messages2(self, hours=0, user=None):
        query = "SELECT l.timestamp, n.nick, l.message " \
                "FROM cardboardlog l, cardboardnick n WHERE l.name = n.jid"
        param = ()
        if hours > 0:
            query += " AND l.timestamp > ?"
            seconds = hours * 3600
            now = time.time()
            timefrom = now - seconds
            param = (timefrom, )
        if user is not None:
            query += " AND n.id = ?"
            param += (user, )
        query += " ORDER BY l.timestamp DESC, l.id DESC"
        data = self.select(query, param)
        data.reverse()
        return data

    def get_links2(self, hours=0, user=None, domain=None):
        query = "SELECT l.timestamp, n.nick, l.url, l.title " \
                "FROM cardboardlinks l, cardboardnick n " \
                "WHERE l.name = n.jid"
        param = ()
        if hours > 0:
            query += " AND l.timestamp > ?"
            seconds = hours * 3600
            now = time.time()
            timefrom = now - seconds
            param = (timefrom, )
        if user is not None:
            query += " AND n.id = ?"
            param = param + (user, )
        if domain is not None:
            query += " AND l.domain = ?"
            param = param + (domain, )
        query += " ORDER BY l.timestamp DESC, l.id DESC"
        data = self.select(query, param)
        data.reverse()
        return data

    def get_domains(self):
        data = self.select("SELECT DISTINCT domain FROM cardboardlinks ORDER BY domain ASC")
        return data

    def get_users(self):
        data = self.select("SELECT id, jid, nick FROM cardboardnick ORDER BY nick ASC;")
        return data

    def get_user(self, user=None):
        data = self.select("SELECT id, jid, nick FROM cardboardnick WHERE id=?", param=(user, ))
        return data[0]

    def get_user_by_jid(self, user=None):
        data = self.select("SELECT id, jid, nick FROM cardboardnick WHERE jid=?", param=(user, ))
        return data[0]

    def get_messages(self, limit=20, user=None):
        param = ()
        query = "SELECT l.timestamp, n.nick, l.message " \
                "FROM cardboardlog l, cardboardnick n " \
                "WHERE l.name = n.jid "
        if user is not None:
            query += " AND n.id = ?"
            param = param + (user, )
        query += "ORDER BY l.timestamp DESC, l.id DESC " \
                 "LIMIT " + str(limit)
        data = self.select(query, param)
        data.reverse()
        return data

    def get_links(self, limit=20, user=None, domain=None):
        param = ()
        query = "SELECT l.timestamp, n.nick, l.url, l.title " \
                "FROM cardboardlinks l, cardboardnick n " \
                "WHERE l.name = n.jid "
        if user is not None:
            query += " AND n.id = ?"
            param = param + (user, )
        if domain is not None:
            query += " AND l.domain = ?"
            param = param + (domain, )
        query += "ORDER BY l.timestamp DESC, l.id DESC " \
                 "LIMIT " + str(limit)
        data = self.select(query, param)

        data.reverse()
        return data

    def get_users_by_messages(self, limit=False):
        query = "SELECT n.nick, COUNT(l.message) AS count " \
                "FROM cardboardlog l, cardboardnick n " \
                "WHERE l.name = n.jid " \
                "GROUP BY l.name " \
                "ORDER BY count DESC"
        if limit:
            query += " LIMIT 10"
        data = self.select(query)
        return data

    def get_users_by_links(self, limit=False):
        query = "SELECT n.nick, COUNT(l.url) AS count " \
                "FROM cardboardlinks l, cardboardnick n " \
                "WHERE l.name = n.jid " \
                "GROUP BY l.name " \
                "ORDER BY count DESC"
        if limit:
            query += " LIMIT 10"
        data = self.select(query)
        return data

    def get_domains_by_links(self, limit=False, user=None):
        query = "SELECT l.domain, count(l.domain) AS count " \
                "FROM cardboardlinks l, cardboardnick n " \
                "WHERE l.name = n.jid"
        param = None
        if user:
            query += " AND n.id=?"
            param = (user, )
        query += " GROUP BY domain ORDER BY count DESC"
        if limit:
            query += " LIMIT 10"
        data = self.select(query, param)
        return data

    def get_users_by_message_link_ratio(self, limit=False):
        query = "SELECT n.nick, " \
                "((SELECT COUNT(url) " \
                "FROM cardboardlinks " \
                "WHERE cardboardlinks.name = l.name)" \
                " / CAST(COUNT(message) AS REAL)) * 100 AS ratio " \
                "FROM cardboardlog l, cardboardnick n " \
                "WHERE l.name = n.jid AND l.name IN (" \
                "SELECT DISTINCT name " \
                "FROM cardboardlinks) " \
                "GROUP BY l.name " \
                "ORDER BY ratio DESC"
        if limit:
            query += " LIMIT 10"
        data = self.select(query)
        return data

    def get_link_counts(self, user=None):
        query = "SELECT COUNT(l.url) " \
                "FROM cardboardlinks l, cardboardnick n " \
                "WHERE l.name = n.jid"
        param = None
        if user:
            query += " AND n.id=?"
            param = (user, )
        data = self.select(query, param)
        count = data[0][0]
        return count

    def get_log_counts(self, user=None, jid=None):
        query = "SELECT COUNT(l.message) " \
                "FROM cardboardlog l, cardboardnick n " \
                "WHERE l.name = n.jid"
        param = None
        if user:
            query += " AND n.id=?"
            param = (user, )
        elif jid:
            query += " AND n.jid=?"
            param = (jid, )
        data = self.select(query, param)
        count = data[0][0]
        return count

    def get_nick(self, user=None, userid=None):
        query = "SELECT nick FROM cardboardnick "
        if user:
            query += "AND jid=?"
            param = (user, )
        elif userid:
            query += "AND id=?"
            param = (userid, )
        else:
            return None
        data = self.select(query, param)
        return data[0][0]

    def select(self, query, param=None):
        db = sqlite3.connect(self.dbpath)
        c = db.cursor()
        if param:
            c.execute(query, param)
        else:
            c.execute(query)
        data = c.fetchall()
        c.close()
        return data