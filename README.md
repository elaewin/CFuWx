# CFuWx
----
iOS version of uWx Android app (unofficial)

## User Stories

(Will be included soon!)

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

Background images from [Unsplash](https://unsplash.com/)

Weather forecast data from the [Dark Sky API](https://darksky.net/dev/).

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
