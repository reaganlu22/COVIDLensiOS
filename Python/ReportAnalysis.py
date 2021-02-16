# Flask app
#import Pandas as pd

import pandas as pd
from flask import Flask, redirect, url_for, render_template, request, jsonify

import json

#from tabulate import tabulate
#import gmaps
#import gmaps.datasets
#gmaps.configure(api_key="AIzaSyAzmApT......")

app = Flask(__name__)

@app.route("/")
def home():
    return 'Api Test'

@app.route("/api", methods=["POST", "GET"])

def api():
    if request.method == "POST":
        data = request.data

        if not(data is None):
            #Sample Test data from database that woukd be passes in as an argument
            testData = [ {'timeStamp' : '2020-10-12', 'userID' : '1230', 'locationID' : '1234', 'residenceHall' : 'Jefferson Suites',
                          'reportStatus' : 'Confirmed', 'age' : 23, 'phoneNumber' : '123-456-7890', 'reportInfor' : 'abcdefgh',
                          'situationDesc' : 'ijklmno', 'affiliation' : 'Student', 'confirmerID' : ''},
                         {'timeStamp' : '2020-09-12', 'userID' : '1231', 'locationID' : '1234', 'residenceHall' : 'Ragsdale Mendenhall Residence Hall',
                          'reportStatus' : 'Not Confirmed', 'age' : 23, 'phoneNumber' : '121-456-7890', 'reportInfor' : 'abcdefgh',
                          'situationDesc' : 'ijklmno', 'affiliation' : 'Student', 'confirmerID' : ''},
                         {'timeStamp' : '2020-08-12', 'userID' : '1232', 'locationID' : '1234', 'residenceHall' : 'NA',
                          'reportStatus' : 'Confirmed', 'age' : 23, 'phoneNumber' : '123-236-7890', 'reportInfor' : 'abcdefgh',
                          'situationDesc' : 'ijklmno', 'affiliation' : 'Student', 'confirmerID' : ''},
                         {'timeStamp' : '2020-07-12', 'userID' : '1233', 'locationID' : '1234', 'residenceHall' : 'Jefferson Suites',
                          'reportStatus' : 'Not Confirmed', 'age' : 23, 'phoneNumber' : '123-456-7490', 'reportInfor' : 'abcdefgh',
                          'situationDesc' : 'ijklmno', 'affiliation' : 'Student', 'confirmerID' : ''},
                         {'timeStamp' : '2020-06-12', 'userID' : '1234', 'locationID' : '1234', 'residenceHall' : 'Spartan Village',
                          'reportStatus' : 'Confirmed', 'age' : 23, 'phoneNumber' : '12-436-7990', 'reportInfor' : 'abcdefgh',
                          'situationDesc' : 'ijklmno', 'affiliation' : 'Student', 'confirmerID' : ''},
                         {'timeStamp' : '2020-06-12', 'userID' : '1235', 'locationID' : '1234', 'residenceHall' : 'Ragsdale Mendenhall Residence Hall',
                          'reportStatus' : 'Confirmed', 'age' : 23, 'phoneNumber' : '123-436-7870', 'reportInfor' : 'abcdefgh',
                          'situationDesc' : 'ijklmno', 'affiliation' : 'Faculty', 'confirmerID' : ''} ]

            #json_data_database = sys.argv[1:] #convert data gotten from testRunner to json
            #df = pd.read_json(json_data_database) #convert json data from database to pandas dataframe
            #df['Reports'] ??

            #json_data = data #convert test data to json

            df = pd.read_json(data) #convert json data to pandas dataframe
            #df

            #print(df.describe()) #summary of data in database
            #print(df.reportStatus.value_counts())

            #Data to be represented on the table based on testData
            a = df[(df.reportStatus == 'Confirmed') & (df.affiliation == 'Student')]
            Students = len(a.index)
            #print(Students)

            b = df[(df.reportStatus == 'Confirmed') & (df.affiliation == 'Faculty')]
            Faculty = len(b.index)
            #print(Faculty)

            c = df[(df.reportStatus == 'Confirmed') & (df.affiliation == 'Staff')]
            Staff = len(c.index)
            #print(Staff)

            d = df[(df.reportStatus == 'Confirmed') & (df.affiliation == 'Contractor')]
            Contractors = len(d.index)
            #print(Contractors)

            Total = Students + Faculty + Staff + Contractors
            #print(Total)

            #print(' ')

            #Data to the represented on the map based on testData
            e = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Cone Residence Hall')]
            Cone = len(e.index)
            #print(Cone)
            f = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Grogan Residence Hall')]
            Grogan = len(f.index)
            #print(Grogan)
            g = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Guilford Residence Hall')]
            Guilford = len(g.index)
            #print(Guilford)
            h = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Mary Foust Residence Hall')]
            MaryFoust = len(h.index)
            #print(MaryFoust)
            i = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Moore Strong Residence Hall')]
            MooreStrong = len(i.index)
            #print(MooreStrong)
            j = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'North Spencer Residence Hall')]
            NorthSpencer = len(j.index)
            #print(NorthSpencer)
            k = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Phillips Hawkins Residence Hall')]
            PhillipHawkins = len(k.index)
            #print(PhillipHawkins)
            l = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Ragsdale Mendenhall Residence Hall')]
            RagsdaleMenden = len(l.index)
            #print(RagsdaleMenden)
            m = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Reynolds Residence Hall')]
            Reynolds = len(m.index)
            #print(Reynolds)
            n = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'South Spencer Residence Hall')]
            SouthSpencer = len(n.index)
            #print(SouthSpencer)
            o = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Weil Winfield Residence Hall')]
            WeilWinfield = len(o.index)
            #print(WeilWinfield)
            p = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Jefferson Suites')]
            JSuites = len(p.index)
            #print(JSuites)
            q = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Shaw Residence Hall')]
            Shaw = len(q.index)
            #print(Shaw)
            r = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Gray Residence Hall')]
            Gray = len(r.index)
            #print(Gray)
            s = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Hinshaw Residence Hall')]
            Hinshaw = len(s.index)
            #print(Hinshaw)
            t = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Bailey Residence Hall')]
            Bailey = len(t.index)
            #print(Bailey)
            u = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Cotton Residence Hall')]
            Cotton = len(u.index)
            #print(Cotton)
            v = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Coit Residence Hall')]
            Coit = len(v.index)
            #print(Coit)
            w = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Jamison Residence Hall')]
            Jamison = len(w.index)
            #print(Jamison)
            x = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Spartan Village')]
            SpartanVillage = len(x.index)
            #print(SpartanVillage)
            y = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Spring Garden Apartments')]
            SpringGarden = len(y.index)
            #print(SpringGarden)
            z = df[(df.reportStatus == 'Confirmed') & (df.residenceHall == 'Tower Village')]
            TowerVillage = len(z.index)
            #print(TowerVillage)

            halls = [
                {"name": "Cone Residence Hall", "location": ('36.071220', '-79.807663'), "confirmed cases": Cone}, #Cone Residence Hall
                {"name": "Grogan Residence Hall", "location": ('36.071238', '-79.808695'), "confirmed cases": Grogan}, #Grogan Residence Hall
                {"name": "Guilford Residence Hall", "location": ('36.070312', '-79.808645'), "confirmed cases": Guilford}, #Guilford Residence Hall
                {"name": "Mary Foust Residence Hall", "location": ('36.070248', '-79.807991'), "confirmed cases": MaryFoust}, #Mary Foust Residence Hall
                {"name": "Moore Strong Residence Hall", "location": ('36.071925', '-79.810980'), "confirmed cases": MooreStrong}, #Moore Strong Residence Hall
                {"name": "North Spencer Residence Hall", "location": ('36.069807', '-79.808637'), "confirmed cases": NorthSpencer}, #North Spencer Residence Hall
                {"name": "Phillips Hawkins Residence Hall", "location": ('36.072588', '-79.809874'), "confirmed cases": PhillipHawkins}, #Phillips Hawkins Residence Hall
                {"name": "Ragsdale Mendenhall Residence Hall", "location": ('36.070663', '-79.810001'), "confirmed cases": RagsdaleMenden}, #Ragsdale Mendenhall Residence Hall
                {"name": "Reynolds Residence Hall", "location": ('36.070988', '-79.809119'), "confirmed cases": Reynolds}, #Reynolds Residence Hall
                {"name": "South Spencer Residence Hall", "location": ('36.068966', '-79.808702'), "confirmed cases": SouthSpencer}, #South Spencer Residence Hall
                {"name": "Weil Winfield Residence Hall", "location": ('36.071187', '-79.811050'), "confirmed cases": WeilWinfield}, #WeilWinfield Residence hall
                {"name": "Jefferson Suites", "location": ('36.064802', '-79.813160'), "confirmed cases": JSuites}, #Jefferson Suites
                {"name": "Shaw Residence Hall", "location": ('36.068831', '-79.811276'), "confirmed cases": Shaw}, #Shaw Residence Hall
                {"name": "Gray Residence Hall", "location": ('36.069313', '-79.810866'), "confirmed cases": Gray}, #Gray Residence Hall
                {"name": "Hinshaw Residence Hall", "location": ('36.069339', '-79.811541'), "confirmed cases": Hinshaw}, #Hinshaw Residence Hall
                {"name": "Bailey Residence Hall", "location": ('36.069931', '-79.811485'), "confirmed cases": Bailey}, #Bailey Residence Hall
                {"name": "Cotton Residence Hall", "location": ('36.069862', '-79.810816'), "confirmed cases": Cotton}, #Cotton Residence Hall
                {"name": "Coit Residence Hall", "location": ('36.070422', '-79.810766'), "confirmed cases": Coit}, #Coit Residence Hall
                {"name": "Jamison Residence Hall", "location": ('36.070482', '-79.811409'), "confirmed cases": Jamison}, #Jamison Residence Hall
                {"name": "Spartan Village", "location": ('36.062848', '-79.809885'), "confirmed cases": SpartanVillage}, #Spartan Village
                {"name": "Spring Garden Apartments", "location": ('36.065425', '-79.814261'), "confirmed cases": SpringGarden}, #Spring Garden Apartments
                {"name": "Tower Village", "location": ('36.064436', '-79.814264'), "confirmed cases": TowerVillage} #Tower Village
            ]

            MapInfo = halls
            Table = {'Students': Students, 'Faculty': Faculty, 'Staff': Staff, 'Contractors': Contractors, 'Total': Total}

            completeData = {'MapStats' : MapInfo, 'TableStats' : Table}

            return jsonify(completeData)


            #return (Table)
            #return jsonify(dict(data1))

            #return jsonify({"status" : "Anything"})
        else:
           return jsonify({"status" : "FAILED"})

    else:
        return 'No Data'


if __name__ == "__main__":
    app.run(debug=True)
