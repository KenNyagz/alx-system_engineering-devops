` `		<h1>EG corp Database collapse report</h1>

The following event aims to describe the widespread database collapse that took place on 11th April 2024 at 8:50pm EAT in Nairobi, Kenya


<h3>Issue Summary</h3>
From 8:50pm to 9:40pm EAT, requests asking any form of customer data saved in the database resulted in a 500 error response message. This translated to about 55% of all traffic to the app. The root cause of this collapse was an introduction of a table to the app's main database whose schema(Foregn Key setting) conflicted with the rest of the tables.

<h3>Timeline(in East African Time)</h3>
- 8:50 PM: Alert for database collapse sent to dev team
- 9:15 PM: Conflicting table dropped
- 9:20 PM: MySQL process restarted
- 9:30 PM: Dev team restarts database monitoring
- 9:40 PM: All systems restored to full operation

<h3>Root Cause</h3>
At 8:50 PM EAT, a new table named 'Customer debt' was added to the database 'Customers Accounts". The table's schema, specifically the Foreign Key assignment, collided with another table 'Customer refunds' resulting in a SQLAlchemy instrumentation error.

<h3>Effects and Extents</h3>
The DB collapse affected end users majorly. Our London office also registered 500 error messages while carrying on with their duties.

<h3>Preventive Measures</h3>
A test environment and test branch to be created to handle all non-tested and non-approved changes.

A more convinient roll back system to be established to make rolling back changes easier



Regards.

The `Backend` team
