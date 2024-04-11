<h1>EG corp Database collapse report</h1>

The following event aims to describe the widespread database collapse that took place on 11th April 2024 at 8:50pm EAT in Nairobi, Kenya


<h3>Issue Summary</h3>
From 8:50pm to 10:25pm EAT, requests asking any form of customer data saved in the database resulted in a 500 error response message. This translated to about 55% of all traffic to the app. The root cause of this collapse was an introduction of a table to the app's main database whose schema(Foregn Key setting) conflicted with the rest of the tables.
