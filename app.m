daqlist("ni")
dq = daq("ni");
dq.Rate = 1;
addinput(dq, "Dev2", "ai0", "Voltage");

data = timetable();

for i = 0:1
    dataTmp = read(dq, seconds(5));
    dataTmp.Time = dataTmp.Time;
    data = [data; dataTmp]
    dataTmp = 0;
end