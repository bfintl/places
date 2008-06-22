# Bootstrap your places

There are a lot of standards that exist for identifying and categorizing all the places in the world. This project attempts to capture them into a set of scripts that can be used to bootstrap your database of places.

See [data/all.csv](data/all.csv) for the most current tab-delimited data.

This project was started specifically to provide bootstrapping and updating for the database of places at [Missions Bridge](http://missionsbridge.org/) and so is targeted at Rails and Merb web applications. Contributions are welcome!

<http://github.com/bfintl/places>

## Goals for data captured

### Identifiers

* **Endonyms and exonyms:** Names that locals have for their places (endonyms) as well as the names that foreign language speakers give them. We'd like this data set to be as universal and local as possible. (i18n, l10n)
* **Short identifiers:** For example, the ISO 3166 formats list various short identifiers for use in a number of other standards. These kinds of identifiers would be excellent for permalinks in the URLs of a web application.

### Hierarchy

Starting with the planet Earth and working its way down through Continents, Regions and Countries to your State/Province/City/Etc.

We know, it's a lot of data, and others are doing a great job capturing it. The point here is not to duplicate other efforts as it is to find as much as possible that is useful for bootstrapping or supplementing new and existing projects with universal place data.

Speaking of others who capture this data, who's working on that?

* [Urban Mapping](http://urbanmapping.com)
* Fill me in on others...

## TODO

* Find some hierarchy data for continents and major regions of the world. I think the UN has a useful list for this stuff.
* Parse and scrape ISO-3166-1 and ISO-3166-2 codes into CSV, YAML, whatever
* Create a unified ISO-3166 YAML file, SQL dump, ActiveRecord model import script, Datamapper model and import script, whatever else...
* Locate a good source of endonyms and exonyms for countries and their regions
* Create a unified YAML file or Ruby script with major world hierarchy and identifiers

## Licensing

Much of this data is public domain or otherwise freely licensed.

All of my ISO 3166 data so far is from [Wikipedia](http://en.wikipedia.org/wiki/ISO_3166).

Original code is licensed [CC-BY-SA](http://creativecommons.org/licenses/by-sa/3.0/).

## Contact

Nick Zadrozny, <nick@beyondthepath.com>

Freelance Web Developer, [Beyond the Path](http://beyondthepath.com)

Co-founder/CEO, [Beautiful Feet Intl](http://beautifulfeetintl.org)
