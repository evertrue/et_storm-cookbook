# Changelog

## v3.0.2 (2018-08-16)

* Bump apache_storm to 4.1.1

## v3.0.1 (2016-08-30)

* Fix the tests
    - Test that supervisor starts up with VAULT_TOKEN value set
    - Add vault environment setup to the test harness
    - Fix the test rig mainly by merging the whole cluster onto one server and installing ZK entirely with packages
* Bump apache_storm to 4.1.0

## v3.0.0 (2016-08-30)

* Upgrade to jdk 8

## v2.0.13 (2015-10-05)

* Force utf8 encoding on worker jvms

## v2.0.12 (2015-06-22)

* Bump apache_storm to 4.0.2

## v2.0.11 (2015-05-28)

* Allow sudo to be used with kill-topology script instead of storm kill

## v2.0.10 (2015-05-28)

* Subscribe commons codec to extract_httpcomponents instead of extract_storm

## v2.0.9 (2015-05-28)

* Commons codec can't be installed until storm has been extracted

## v2.0.8 (2015-05-28)

* Remote files are created, not run...

## v2.0.7 (2015-05-28)

* Create jar files by notifications from extract_httpcomponents instead of inline
* Add some scripts for listing and killing topologies

## v2.0.6 (2015-03-04)

* Remove extraneous slash from cache path references

## v2.0.5 (2015-03-03)

* Restructure notifies (again), always copying files that come from a local source

## v2.0.4 (2015-03-02)

* Remove old supplemental libraries installed by us

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
