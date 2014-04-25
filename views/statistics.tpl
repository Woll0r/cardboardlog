% rebase('main_page.tpl', title='CardboardBot Statistics')

<div class="row">
  <div class="small-12 columns">
    <h1>Cardboardbot Statistics</h1>
    <ul class="small-block-grid-4">
      <li>
        <div class="panel radius text-center">
          <h1>{{messagecount}}</h1>
          <p>Messages processed</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
          <h1>{{cardboardbotmessagecount}}</h1>
          <p>Responses given</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
          <h1>{{linkcount}}</h1>
          <p>Links processed</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
          <h1>{{linkpercentage}}%</h1>
          <p>Percentage of links</p>
        </div>
      </li>
    </ul>
    <ul class="small-block-grid-3">
      <li>
        <div class="panel radius">
          <h3>Messages</h3>
          <ol>
            % for row in mostmessages:
            <li>{{row[0]}} ({{row[1]}})</li>
            % end
          </ol>
        </div>
      </li>
      <li>
        <div class="panel radius">
          <h3>Links</h3>
          <ol>
            % for row in mostlinks:
            <li>{{row[0]}} ({{row[1]}})</li>
            % end
          </ol>
        </div>
      </li>
      <li>
        <div class="panel radius">
          <h3>Link/message ratio</h3>
          <ol>
            % for row in messagelinkratio:
            % ratio = "{0:.2f}".format(row[1])
            <li>{{row[0]}} ({{ratio}}%)</li>
            % end
          </ol>
        </div>
      </li>
    </ul>
  </div>
</div>