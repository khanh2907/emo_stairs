TechLab Rails Template
================

Acknowledgements
-----------
This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

This has been stolen from [Khanh's rails template](https://github.com/khanh2907/khanhs_rails_template)

Rename the project using

~~~
rake template:rename NEW_NAME=<YourAppName>
~~~

Make sure to make a PG database user <your_app_name>

~~~
sudo su postgres
createuser -s -e <your_app_name>
~~~


 - Make sure to set your postgres settings to trust local connections

TODO
----
Automate database setup