'''
import datetime
import time
print(time.time())
print(time.asctime())
datetime_object = datetime.datetime.now()
print(datetime_object)
print("Year:", datetime_object.year)
print("Month:", datetime_object.month)
print("Day:", datetime_object.day)
print("Hour:", datetime_object.hour)
print("Minute:", datetime_object.minute)
print("Second:", datetime_object.second)
print("Second:", datetime_object.microsecond)

import calendar
s = calendar.month(2025,12)
s1 = calendar.isleap(2005)
print(s)
print(s1)

import calendar
s = calendar.prcal(3025)
'''

import datetime
x = datetime.datetime.now()
from datetime import timedeltapytz
print(x + timedelta(days = -89))
print(type(x))