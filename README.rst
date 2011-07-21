Example app for accessing a Tableau server through a trusted interface using Rails. This code is based off the tableau_trusted_interface.rb file that ships with Tableau server.

Prerequisites
===============

1. You must install a tableau server and create an account for your users on that server.
2. You must use the tableau commandline "tabadmin" to add the rails server to the list of trusted hosts. From a windows prompt you'd type:

tabadmin set wgserver.trusted_hosts "COMMA DELIMITED LIST OF IP ADDRESSES"
tabadmin config
tabadmin restart

Then edit the config/tableau.yml file appropriately

Testing An Example
===============

Create A Tableau user and assign them to a worksheet (or make them an admin to the entire server)
In the ReportsController change this instance variable to the desired worksheet view:

@tabpath   = '/views/Finance/InvestinginDJIA'

Then start your server and have fun. You should notice that logging in as any user without access prevents Tableau from
returning a valid ticket (it will return -1). When you use a valid username you should notice that the Tableau view loads up just fine.