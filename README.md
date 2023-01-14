# Planter Jr
Plant UML code visualizer.

## Build pre-requisites

- JDK (tested with OpenJDK 11 and 18)
- JRuby (tested with 9.3.9.0)

## Build

```
./gradlew clean build jrubyJar
```

This builds supportive Java code and and copies libraries next to the ruby code.

## Run pre-requisites
Planter Jr assumes that dot (graphviz) is installed on the system.
Linux:
sudo apt install graphviz

## Run

```
cd main/src/main/ruby
jruby main.rb
```
