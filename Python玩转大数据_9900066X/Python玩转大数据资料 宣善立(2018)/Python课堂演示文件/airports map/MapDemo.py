#http://www.lfd.uci.edu/~gohlke/pythonlibs/

#basemap‑1.1.0‑cp36‑cp36m‑win32.whl
#pyproj‑1.9.5.1‑cp36‑cp36m‑win32.whl
#local install

from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as Plt
# Import the pandas library.
import pandas as Pd
# Read in the airports data.

DataAps = Pd.read_csv(r"airports.csv", header=None, dtype=str)

DataAps.columns = ["id", "name", "city", "country", "code", "icao", "latitude", "longitude", "altitude", "offset", "dst", "timezone","Na","Na"]
DataAps.to_csv(r"A.csv")
DataAps.to_excel(r"A.xls")

Plt.figure(figsize=(14,10))
Plt.rcParams['font.family'] = 'SimHei'
Plt.rcParams['font.sans-serif'] = ['SimHei']

#Mymap = Basemap()
#China
#Mymap = Basemap(llcrnrlon=73, llcrnrlat=3, urcrnrlon=135, urcrnrlat=54)
#Mymap = Basemap(llcrnrlon=77, llcrnrlat=14, urcrnrlon=140, urcrnrlat=51, projection='lcc', lat_1=33, lat_2=45, lon_0=100)
#Anhui
#Mymap = Basemap(llcrnrlon=113, llcrnrlat=29, urcrnrlon=121, urcrnrlat=36)

#Mymap =Basemap(llcrnrlon= -180, llcrnrlat= -80, urcrnrlon= 180, urcrnrlat= 80, projection='merc', lat_ts = 20, resolution = 'c')


Mymap= Basemap(projection='ortho', resolution=None, lat_0=20, lon_0=+100)
Mymap.bluemarble(scale=0.5)

#Mymap.drawcoastlines()
#Mymap.drawcountries(linewidth=1.0)


Mymap.readshapefile(r'CHN_adm_shp/CHN_adm1', 'states', drawbounds=True)

x,y = Mymap(list(DataAps["longitude"].astype(float)),list(DataAps["latitude"].astype(float)))

#Xuan cheng longitude & latitude
xt,yt = Mymap(118.75,30.95)
xtA,ytA = Mymap(117.0,32.0)
print(type(xt))

Plt.scatter(x,y,color = 'r',s = 30,edgecolors= 'y')
Plt.scatter(xt,yt,color = 'b',s = 50,edgecolors= 'y')
Plt.text(xt,yt,'宣城',color = 'y' ,fontsize = 12)
Plt.text(xtA,ytA,'安徽省',color = 'r' ,fontsize = 16)

Plt.show()

