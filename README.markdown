# Bootstrap your places

There are a lot of standards that exist for identifying and categorizing all the places in the world. This project attempts to capture them into a set of scripts that can be used to bootstrap your database of places.

See [data/all.csv](master/data/all.csv) for the most current tab-delimited data.

This project was started specifically to provide bootstrapping and updating for the database of places at [Missions Bridge](http://missionsbridge.org/) and so is targeted at Rails and Merb web applications. Contributions are welcome!

<http://github.com/bfintl/places>

## Goals

### Identifiers

* **Endonyms and exonyms:** Names that locals have for their places (endonyms) as well as the names that foreign language speakers give them. We'd like this data set to be as universal and local as possible. (i18n, l10n)
* **Short identifiers:** For example, the ISO 3166 formats list various short identifiers for use in a number of other standards. These kinds of identifiers would be excellent for permalinks in the URLs of a web application.

### Hierarchy

Starting with the planet Earth and working its way down through Continents, Regions and Countries to your State/Province/City/Etc. There are a lot of projects that are capturing this stuff in detail, so I'll tend to err on the side of pragmatic rather than comprehensive.

## TODO

* Nov 2008
** Implement support for Yahoo! GeoPlanet API
** Implement Yahoo! GeoPlanet client as a Merb slice
* Jun 2008
** Add country subdivisions (ISO 3166-2)
** Create unified data output in more formats: CSV, YAML, SQL
** Create an ActiveRecord model and import script
** Create a Data Mapper model and import script
** Locate a good source of endonyms and exonyms for countries and their regions

## Other

### Sources

* [Wikipedia - ISO 3166](http://en.wikipedia.org/wiki/ISO_3166)
* [UN Statistics Division - Standard Country and Area Codes Classification (M49)](http://unstats.un.org/unsd/methods/m49/m49regin.htm)
* **New:** The [Yahoo! GeoPlanet API](http://developer.yahoo.com/geo/) looks perfect for this.

### License

Original code is licensed [CC-BY-SA](http://creativecommons.org/licenses/by-sa/3.0/).

### Contact

Nick Zadrozny, <nick@beyondthepath.com>

Freelance Web Developer, [Beyond the Path](http://beyondthepath.com)

Co-founder/CEO, [Beautiful Feet Intl](http://beautifulfeetintl.org)
