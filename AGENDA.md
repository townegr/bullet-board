# AGENDA

### Development TODO Checklist

- capture only eager-loading queries per request
- due diligence on integrating with [GoAccess](https://goaccess.io) as a web log analyzer
- use [UniformNotifier](https://github.com/flyerhzm/uniform_notifier) for Slack integration to notify developers when their pull requests contribute to new instances of N+1 queries
  - send Slack notification to designated public channel with @<user-name> identifier to notify user
- configure for QA/UAT boxes
  - integrate with DevOps tool to pull down reports of N+1 statistics
- TODO: I/O ramifications for turning off sync mode [File#sync] and only write when file is closed
  - supposedly faster according to some sources
- Address conflicts when requiring both Bullet and BulletBoard
  - only load extensions if `BulletBoard.enable = true`
- Transform gem into a Rails mountable engine for web interface reporting
  - example of mountable engine web interface: [https://github.com/tatey/delayed-web]
  - CC: Ryan Bates [http://railscasts.com/episodes/277-mountable-engines?autoplay=true]
    - outdated example for creating engine
