import socket
import datetime as dt
import time
from datetime import date, datetime


class ContainerInfo:
    def __init__(self):
        self.date = date.today().strftime("%B %d, %Y")
        self.time = datetime.now().strftime("%H:%M:%S")
        self.timezone = str(dt.timezone(dt.timedelta(seconds=-time.timezone)))
        self.hostname = socket.gethostname()
        self.ip = socket.gethostbyname(socket.gethostname())
