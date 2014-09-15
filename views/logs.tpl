% import datetime

% rebase('main_page.tpl', title="CardboardBot Logs")

<form action="/log2" method="post" data-abide>
<div class="row">
    <div class="small-12 columns">
        <div class="row">
            <div class="small-3 medium-2 columns input-wrapper">
                <label>Time <small class="error">Should be numeric.</small>
                <input name="hours" type="text" placeholder="6" pattern="number">
                </label>
            </div>
            <div class="small-8 medium-8 columns">
                <label>Name
                <select name="user">
                <option>-</option>
                % for row in nicks:
                <option value="{{row[0]}}">{{row[1]}}</option>
                % end
                </select>
                </label>
            </div>
            <div class="small-1 medium-2 columns">
                <button type="submit" class="button expand">Filter</button>
            </div>
        </div>
    </div>
</div>
</form>

<div class="row">
  <div class="small-12 columns">
    <table style="width: 100%">
      <thead>
        <tr class="row">
          <th class="small-3 medium-2 columns">Timestamp</th>
          <th class="small-3 medium-2 columns">Sender</th>
          <th class="small-6 medium-8 columns">Message</th>
        </tr>
      </thead>
      <tbody>
        <%
        for row in data:
        date = datetime.datetime.fromtimestamp(row[0])
        datestring = date.strftime("%x %X")
        sender = row[1]
        message = row[2]
        %>
        <tr class="row">
          <td class="small-3 medium-2 columns">{{datestring}}</td>
          <td class="small-3 medium-2 columns">{{sender}}</td>
          <td class="small-6 medium-8 columns">{{message}}</td>
        </tr>
        % end
      </tbody>
    </table>
  </div>
</div>