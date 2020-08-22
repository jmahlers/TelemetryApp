# TelemetryApp 
Team website: https://sae.wustl.edu/

Wash U Racing is Washington University in St. Louis' Formula SAE team. We design, build, and compete a formula style race car every year.

## About
This serves as a iOS telemetry client for the WashU Racing sensor suite written in Swift. It features live graphing of telemetry data and graphing of previous runs from the sensor database using the iOS Charts framework. Telemetry data is ingressed from the existing WashU Racing SSE server using the EventSource library. Dynamic sensor additions and removals are supported in addition to a sensor favoriting system. The most important sensors can be pinned to a dock which can be expanded to show the current raw value of each sensor.

![App Gif](https://github.com/jmahlers/TelemetryApp/blob/Beta/ReadmeAssets/WashuRacingTelemetry_1.gif)
## Live Telemetry Graphing

* Using iOS Charts, the live telemetry graphs updated at up to 10 Hz.
* Both the raw scatter plot and a rolling average trendline are shown.

<img width="250" alt="portfolio_view" src="https://github.com/jmahlers/TelemetryApp/blob/Beta/ReadmeAssets/homeView.PNG">

## Database Sensor Graphing

<img width="250" alt="portfolio_view" style="padding: 20px;" src="https://github.com/jmahlers/TelemetryApp/blob/Beta/ReadmeAssets/ecuDB.PNG"> <img width="250" alt="portfolio_view" style="padding: 20px;" src="https://github.com/jmahlers/TelemetryApp/blob/Beta/ReadmeAssets/radDB.PNG">

## Weather View

* Using the Dark Sky API, real time temperature, wind speed and other weather statistics are provided for the test locations.

<img width="250" alt="portfolio_view" src="https://github.com/jmahlers/TelemetryApp/blob/Beta/ReadmeAssets/weather.PNG">

## Built With

* [EventSource](https://github.com/inaka/EventSource) - SSE Client
* [iOS Charts](https://www.scichart.com/) - Graphing Framework

## Library Installation
    pod 'IKEventSource'
    pod 'SciChart'
    
## Authors

* **Jeff Ahlers** - *Telemetry Backend/Telemetry View/Favorite System* - [jmahlers](https://github.com/jmahlers)
* **Jake Kendrick** - *Graphing Backend/Database View/Database Backend* - [jken785](https://github.com/jken785)
* **Blake Dorris** - *Weather View* - [bnd25](https://github.com/bnd25)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Connor Monahan, Ethan Shry, and the Wash U Racing Data Acquisition team for hosting the SSE server, creating the database API, and giving an abundance of advice.
