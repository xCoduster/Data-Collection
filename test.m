rate = 10;
counter = 0;
captureTime = 5;

daqlist("ni")
dq = daq("ni");
dq.Rate = rate;
addinput(dq, "Dev1", "ai0", "Voltage");

data = timetable();

for i = 0:1
    dataTmp = read(dq, seconds(5));
    dataTmp.Time = dataTmp.Time + seconds(0);
    data = [data; dataTmp]
    dataTmp = 0;
end