Introduction
Suppose the field "date_of_birth" of the model User accepts manual date input (e.g. “9-7-2013”). This is nice, because it’s much faster than pointing and clicking in a calendar or drop-down menu.
When the application is deployed in different countries / franchises, the date formats should be configurable.

Implementation

   In the configure file, add an entry “date_format”. (The application loads the configure file into AppConfig when it starts.)
       Acceptable values for “date_format” are “big-endian”, “little-endian”, “middle-endian”. In other words: each franchise must work with one of those three date_formats.
   Split the date input into three parts, with dots, spaces, slashes, dashes/hyphens as possible separators.
   Read the elements in the order that the config setting dictates:
       Big-endian: read elements in order year, month, day;
       Little-endian: read elements in order day, month, year;
       Middle-endian: read elements in order month, day, year.
   YEARS:
       require 2 OR 4 digits, otherwise fail
       if the year part is 2 digits, assume 2000 + y. In other words: read “13’ as ‘2013’.
   DAYS AND MONTHS:
       Ignore optional leading zeros (perhaps convert using to_i ?)
       Days must be integer in 1-31 range, otherwise fail
       Months must be integer in 1-12 range, otherwise fail
   Write the date into a format that Rails / the dbms can work with.

Source code

config/config.yml:
```
date_format: ...
```

app/models/user.rb:

```
class User < ActiveRecord::Base

 # Your code here

end
```
