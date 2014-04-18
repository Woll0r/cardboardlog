import bottle

app = bottle.Bottle()
plugin = bottle.ext.sqlite.Plugin(dbfile='/home/wolfgang/cardboardenv/cardboardbot/cardboardlog.db')
app.install(plugin)

@route('/')
@route('/log/<limit:int>')
def log(limit=100):
    data = db_select("SELECT timestamp, name, message FROM cardboardlog ORDER BY timestamp DESC LIMIT ?", limit)
    output = template('loglist', rows=data)
    return output

@route('/links/<limit>')
def links(limit=100):
	data = db_select("SELECT timestamp, name, url, title FROM cardboardlinks ORDER BY timestamp DESC LIMIT ?", limit)
	output = template('linklist', rows=data)
	return output
	
def db_select(query, limit):
    db = sqlite3.connect('cardboardlog.db')
    c = db.cursor()
    c.execute(query, limit)
    data = c.fetchall()
    c.close()
    return data

app.run()
