'''
from datetime import datetime
import pytz

time1 =pytz.timezone('Asia/Seoul')
print("Current time:", datetime.now(time1))
'''
import pytz
from datetime import datetime

for tz in pytz.all_timezones:
    timezone = pytz.timezone(tz)
    print(f"{tz}: {datetime.now(timezone)}")
