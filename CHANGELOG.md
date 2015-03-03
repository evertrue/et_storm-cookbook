# Changelog

## v2.0.3 (2015-03-02)

* Update all of the supplemental libraries and group notifications into their own ruby block

## v2.0.2 (2015-03-02)

* Bump apache_storm to 4.0.1
* Update tests to correspond with changes from 0.9.3

## v2.0.1 (2015-02-27)

* Stop using pessimistic versioning on apache_storm (it got us in trouble)

## v2.0.0 (2015-02-12)

* Upgrade to `apache_storm` v4.0.0
    - Introduces some breaking changes re: the Storm YAML config
    - Improves how we handle logging
* Clean up the testing systems, following the example of `apache_storm`

## v1.1.0 (2014-11-14)

* Add sudoer rules for topology deployments

## v1.0.1 (2014-09-23)

* Bump worker slots

## v0.1.0 (2014-05-22)

* Initial release of et_storm
