---
title: "airsensor-py"
layout: single
author_profile: false
excerpt: "Python package for USB VOC-sensors."
header:
  teaser: /assets/images/airsensor.jpg
sidebar:
  - title: "Technology"
    image: /assets/images/airsensor.jpg
    image_alt: "logo"
    text: "Python"
---

I wrote a package to get sensor values from an airsensor I got on Amazon. It's [available on Github](https://github.com/dfederschmidt/airsensor-py).

Before writing my own package I did some research and found that there is a [C implementation](https://code.google.com/archive/p/airsensor-linux-usb/) available for this sensor. But when testing it I found that it had significant delay to get sensor values. Since I'm planning to use the sensor values from Python anyways I decided to reimplement the functionality from the C implementation leveraging the higher-level [PyUSB](https://walac.github.io/pyusb/) library to interface with the device.

The instructions how to use it are in the [README.md](https://github.com/dfederschmidt/airsensor-py/blob/master/README.md) on Github.
