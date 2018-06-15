
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Welcome to your Rails project on Cloud9 IDE!

To get started, just do the following:

1. Run the project with the "Run Project" button in the menu bar on top of the IDE.
2. Preview your new app by clicking on the URL that appears in the Run panel below (https://HOSTNAME/).

Happy coding!
The Cloud9 IDE team


## Support & Documentation

Visit http://docs.c9.io for support, or to learn more about using Cloud9 IDE. 
To watch some training videos, visit http://www.youtube.com/user/c9ide



The JS snippet

UserInsights requires the following JS snippet to be placed on an app's pages in order to track events:


var userinsights = {} 
userinsights.report = function(eventName){
  var event = {event: {name: eventName}};
  var request = new XMLHttpRequest();
  request.open("POST", "https://user-insights-rickgriff.c9users.io/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
}

How to Use It

Call the report function with an eventName argument which will then be passed on in the request to UserInsights.

For example, it can track click events:
<a href="/about" onclick="userinsights.report('about link clicked')">

Or it can execute when a page is loaded:
<script>userinsights.report('about page loaded');</script>


