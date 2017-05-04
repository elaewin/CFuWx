# CFuWx
----
iOS version of uWx Android app (unofficial)

## User Stories

#### User
* I want to participate in crowd sourced weather data collection using my phone.
* I want to check my local weather, storm warnings. 
* I want to see current weather as well weekly forecasts for my location. 
* I want to see the actual data that my phone is collecting. (like a chart)

#### Developer
* I want to successfully access the Dark Sky Weather API to provide my user with accurate weather data for their location. 
* I want to create an iOS version of the uWx Android application.
* I want to use Core Data to persist collected data on Barometric pressure via Core Motion and Core Location frameworks. 
* I want to create an app that the UW Department of Atmospheric Sciences could potentially use.
* I want to use Test Driven Development as I create my app.

##### Stretch Goals
* I want to provide my user with the option of changing the language that the data is displayed in.
* I want to provide my user with the option of changing the unit of measurement that data is displayed in (F/C).

----

## Curious about the science behind uWx?

Check out these publications to learn more about how pressure observations from smartphones could improve weather forecasting.

* [Surface Pressure Observations From Smartphones: A Potential Revolution for High-Resolution Weather Prediction?](http://journals.ametsoc.org/doi/abs/10.1175/BAMS-D-13-00188.1)
* [Crowdsourcing for climate and atmospheric sciences: current status and future potential](http://onlinelibrary.wiley.com/doi/10.1002/joc.4210/abstract)
* [Utility of Dense Pressure Observations for Improving Mesoscale Analyses and Forecasts](http://journals.ametsoc.org/doi/citedby/10.1175/MWR-D-13-00269.1)
* [The Impact of Assimilating Surface Pressure Observations on Severe Weather Events in a WRF Mesoscale Ensemble System](http://journals.ametsoc.org/doi/abs/10.1175/2009MWR3042.1)
* [Impacts of Frequent Assimilation of Surface Pressure Observations on Atmospheric Analyses](http://journals.ametsoc.org/doi/abs/10.1175/MWR-D-14-00097.1)


## Credits

This project is based on [uWx](https://www.cmetwx.com/), an Andriod app developed by the University of Washington Department of Atmospheric Sciences.

Weather icons from [Daniel Vierich](http://www.danvierich.de/weather/). Other icons from [PixelKit](http://www.iconarchive.com/show/swanky-outlines-icons-by-pixelkit/15-Light-Bulb-icon.html), [thenounproject](https://thenounproject.com/term/barometer/1841/), [Rami McMin](http://www.flaticon.com/free-icon/winds-symbol_53372), [freeicons](http://www.freeiconspng.com/free-images/timer-icon-7808), [Vectorgraphit](http://www.flaticon.com/free-icon/2-drops_15553), and [Freepik](http://www.flaticon.com/authors/freepik).

Charts will be created using [Charts](https://github.com/danielgindi/Charts).

Pressure conversion formulae from [weather.gov](https://www.weather.gov/media/epz/wxcalc/pressureConversion.pdf).

Function to convert degrees to compass bearings from [this question on Stack Overflow](http://stackoverflow.com/questions/13220367/cardinal-wind-direction-from-degrees).

HUGE thanks to Alex Gibson for his help in sorting out what was wrong with our search function!

Background images from [Unsplash](https://unsplash.com/), from the following photographers:

* clear day - [Stephan Jola](https://unsplash.com/@beverin)
* clear night - [Teddy Kelley](https://unsplash.com/@teddykelley)
* rain - [Joy Stamp](https://unsplash.com/@joyfulphotos)
* snow -  [Aaron Wilson](https://unsplash.com/@aaronwilson)
* sleet - [Jordan Andrews](https://unsplash.com/@exit)
* wind - [Joshua Fuller](https://unsplash.com/@joshuafuller)
* fog - [Annie Spratt](https://unsplash.com/@anniespratt)
* cloudy - [Anastasia Petrova](https://unsplash.com/@anastasia_p)
* partly cloudy day - [Luca Baggio](https://unsplash.com/@luca42)
* partly cloudy night - [Taylor Durrer](https://unsplash.com/@insrtclevrname00)
* Daily/Hourly background images by [Alan Chen](https://unsplash.com/@chzenan), [Alessio Lin](https://unsplash.com/@paradox_zer0), [Alex Rodríguez Santibáñez](https://unsplash.com/@alexrds), [Andrew Ruiz](https://unsplash.com/@andrewruiz), [Apostol Voicu](https://unsplash.com/@cerpow), [Artem Sapegin](https://unsplash.com/@sapegin), [Brent Cox](https://unsplash.com/@brentcox), [Conrad Ziebland](https://unsplash.com/@conradz), [Crawford Ifland](https://unsplash.com/@crawfordifland), [Elena Ferrer](https://unsplash.com/@meisi_style), [Eugene Triguba](https://unsplash.com/@eugenetriguba), [Frantzou Fleurine](https://unsplash.com/@frantzou), [freestocks.org](https://unsplash.com/@freestocks), [Ivan Vranić](https://unsplash.com/@hvranic), [Jacob Dyer](https://unsplash.com/@jacobdyer), [Jamie Street](https://unsplash.com/@jamie452), [Jimmy Chang](https://unsplash.com/@photohunter), [Jonatan Pie](https://unsplash.com/@r3dmax), [Jordan Stewart](https://unsplash.com/@jordan_stewart), [Joshua K. Jackson](https://unsplash.com/@joshua), [Karsten Würth](https://unsplash.com/@inf1783), [kazuend](https://unsplash.com/@kazuend), [Kyle Gregory Devaras](https://unsplash.com/@kyledevaras), [Luca Bravo](https://unsplash.com/@lucabravo), [Marc Wieland](https://unsplash.com/@marcwieland95), [Matthew Kane](https://unsplash.com/@matthewkane), [Mike Kotsch](https://unsplash.com/@mike), [Nathan Anderson](https://unsplash.com/@nathananderson), [Neven Krcmarek](https://unsplash.com/@nevenkrcmarek), [Noah Silliman](https://unsplash.com/@noahsilliman), [Piyanut Suntaranil](https://unsplash.com/@npiyanut), [robertdb](https://unsplash.com/@robbertdb), [Seth Schwiet](https://unsplash.com/@schwiet), [Sven Scheuermeier](https://unsplash.com/@sveninho), [Tamar Waskey](https://unsplash.com/@truth99), [Vincent Guth](https://unsplash.com/@vingtcent), [Yosh Ginsu](https://unsplash.com/@yoshginsu), [Yun Xu](https://unsplash.com/@nightmare), [Zachary Young](https://unsplash.com/@mrtwisty)

Powered by the [Dark Sky API](https://darksky.net/dev/).

---

## Group Process

#### Use Waffle.io for tracking issues:

* Add appropriate label when creating issue on Github (eg. "mvp", "stretch goal", "bug", etc.)
* If applicable, add milestone (day to finish) when creating issue.
* Assign yourself to an issue when you start work on it, and add the "in progress" label (or add yourself and drag over to the In Process column in Waffle.)

#### TDD:

* Write at least one test *before* starting on a new function/method.
* Put suggested tests into the issue when you enter it on GH, if possible, so that if someone else picks up the issue, they have a place to start.

#### Github/Git Flow:

* Branch names should include your name, the issue number (with #), and descriptive name, eg. 'pearl#13-readableDateFunc' or 'ruby#15-dateBugFix'.
* ACP **AT LEAST** once every 30 minutes.
* Never merge your own branch!
* Merge party whenever someone finishes an issue.
* Merge Party at the start (after standup meeting) and end of every day (5pm).
* After a merge for someone else's branch, don't forget to pull from master into *your* branch before continuing work.
