# TelemetryApp
Existing data/telemetry site:
http://www.data.wuracing.com/

Team website:
http://sae.wustl.edu/

This serves as a iOS telemetry client for the WashU Racing sensor suite written in Swift. It features live graphing of telemetry data and graphing of previous runs from the sensor database using the iOS Charts framework. Telemetry data is ingressed from the existing WashU Racing SSE server using the EventSource library. Dynamic sensor additions and removals are supported in addition to a sensor favoriting system. The most important sensors can be pinned to a dock which can be expanded to show the current raw value of each sensor.

Using the Dark Sky api, real time temperature, wind speed and other weather statistics are provided for the test locations.

## Built With

* [EventSource](https://github.com/inaka/EventSource) - SSE Client
* [iOS Charts](https://www.scichart.com/) - Graphing Framework

## Authors

* **Jeff Ahlers** - *Telemetry Backend/Telemetry View/Favorite System* - [jmahlers](https://github.com/jmahlers)
* **Jake Kendrick** - *Graphing Backend/Database View/Database Backend* - [jken785](https://github.com/jken785)
* **Blake Dorris** - *Weather View* - [bnd25](https://github.com/bnd25)
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Connor Monahan, Ethan Shry, and the Wash U Racing Data Acquisition team for hosting the SSE server and creating the database api.
