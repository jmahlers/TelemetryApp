# About

<a href="https://sae.wustl.edu/">Wash U Racing<a/> is Washington University in St. Louis' Formula SAE team. We design, build, and compete a formula style race car every year.

This serves as a iOS telemetry client for the WashU Racing sensor suite written in Swift. It features live graphing of telemetry data and graphing of previous runs from the sensor database using the iOS Charts framework. Telemetry data is ingressed from the existing WashU Racing SSE server using the EventSource library. Dynamic sensor additions and removals are supported in addition to a sensor favoriting system. The most important sensors can be pinned to a dock which can be expanded to show the current raw value of each sensor.

<img src="https://raw.githubusercontent.com/jmahlers/TelemetryApp/Beta/ReadmeAssets/WashuRacingTelemetry_1.gif" width="250"/> <img src="https://raw.githubusercontent.com/jmahlers/TelemetryApp/Beta/ReadmeAssets/dockView.gif" width="250"/> 

## Live Telemetry Graphing

* Using iOS Charts, the live telemetry graphs updated at up to 10 Hz.
* Both the raw scatter plot and a rolling average trendline are shown.

<img width="250" alt="homeView" src="https://raw.githubusercontent.com/jmahlers/TelemetryApp/Beta/ReadmeAssets/homeView.PNG">

## Database Sensor Graphing

<img width="250" alt="ecuDB" style="padding: 20px;" src="https://raw.githubusercontent.com/jmahlers/TelemetryApp/Beta/ReadmeAssets/ecuDB.PNG"> <img width="250" alt="radDB" style="padding: 20px;" src="https://raw.githubusercontent.com/jmahlers/TelemetryApp/Beta/ReadmeAssets/radDB.PNG">

## Weather View

* Using the Dark Sky API, real time temperature, wind speed and other weather statistics are provided for the test locations.

<img width="250" alt="weather" src="https://raw.githubusercontent.com/jmahlers/TelemetryApp/Beta/ReadmeAssets/weather.PNG">

## Built With

* [EventSource](https://github.com/inaka/EventSource) - SSE Client
* [iOS Charts](https://www.scichart.com/) - Graphing Framework

## Library Installation
    pod 'IKEventSource'
    pod 'SciChart'
The library for SciCharts can be found at <https://www.scichart.com/>. You will also need a SciCharts license.

For WashU racing members, it is on the 2020 Grabcad under /Frame/TelemetryApp. There is also a copy of my SciCharts license; the license is in perpetuity for the version 2.0.
Contact Jeff Ahlers or Jake Kendrick in order to transfer one of our licenses.

<img width="200" alt="filestructure" style="padding: 20px;" src="https://raw.githubusercontent.com/jmahlers/TelemetryApp/Beta/ReadmeAssets/filestructure.png">

The file structure should look like this after you've placed the files.

## Authors

* **Jeff Ahlers** - *Telemetry Backend/Telemetry View/Favorite System* - [jmahlers](https://github.com/jmahlers)
* **Jake Kendrick** - *Graphing Backend/Database View/Database Backend* - [jken785](https://github.com/jken785)
* **Blake Dorris** - *Weather View* - [bnd25](https://github.com/bnd25)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Connor Monahan, Ethan Shry, and the Wash U Racing Data Acquisition team for hosting the SSE server, creating the database API, and giving an abundance of advice.
