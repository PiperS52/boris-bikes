# Boris Bikes

## Brief
  This aim of this project was to build a program which emulates the functionality of the Transport for London Santander Cycles bicyle hire network across London. This includes the docking stations, bikes and infrastructure - allowing for repair solutions etc. - in order to create a system which can also be easily maintained.

## User Stories
```
  1.  As a member of the public,
      So that I can use a bike,
      I'd like a docking station to release a bike

  2.  As a member of the public,
      So that I can use a good bike,
      I'd like to see if a bike is working

  3.  As a member of the public,
      So I can return bikes I've hired,
      I want to dock my bike at the docking station

  4.  As a member of the public,
      So I can decide whether to use the docking station,
      I want to see a bike that has been docked

  5.  As a member of the public,
      So that I'm not confused and charged unnecessarily,
      I'd like docking stations not to release bikes when there are none available

  6.  As a system maintainer,
      So that I can control the distribution of bikes,
      I'd like docking stations not to accept more bikes than their capacity

  7.  As a system maintainer,
      So that I can plan the distribution of bikes,
      I want a docking station to have a default capacity of 20 bikes

  8.  As a system maintainer,
      So that busy areas can be served more effectively,
      I want to be able to specify a larger capacity when necessary

  9.  As a member of the public,
      So that I reduce the chance of getting a broken bike in the future,
      I'd like to report a bike as broken when I return it

  10. As a system maintainer,
      So that I can manage broken bikes and not disappoint users,
      I'd like docking stations not to release broken bikes

  11. As a system maintainer,
      So that I can manage broken bikes and not disappoint users,
      I'd like docking stations to accept returning bikes (broken or not)

  12. As a system maintainer,
      So that I can manage broken bikes and not disappoint users,
      I'd like vans to collect working bikes from garages and distribute them to docking stations
```

## Getting Started

Clone the repository from GitHub:
```
$ git clone https://github.com/PiperS52/boris-bikes.git
$ cd boris-bikes
```
Load the dependencies:
```
$ bundle install
```
