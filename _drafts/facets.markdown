---
layout: "single"
title:  "Facets - A utility for dataset visualization."
categories: visualization data ml
---

A couple of days ago one of the first tools to come out of the [Google PAIR initiative](https://ai.google/pair) was published on GitHub - [Facets](https://github.com/PAIR-code/facets). 

<!--more-->

It's described as a utility to visualize and understand machine learning datasets which sounds very promising!

The website also states that 

> Better data leads to better models.

which I completely agree with. From practical courses at university and my work at Airbus in the data-driven technologies departement is that the more you know about your data and problem domain it originates from, the better you can build models to make predictions on new data. 

Facets is written in Typescript using [Polymer](https://www.polymer-project.org/) Web Components. Since facets is web-based it integrates well into web pages or all kinds of notebook platforms such as [Jupyter](http://jupyter.org/) or [Apache Zeppelin](https://zeppelin.apache.org/). For using it in Jupyter Notebooks it can be installed as an nbextension. As of now, the sole channel of distribution is Github but i expect it will be available over pip in the near future to make installation more convenient.

Currently facets offers two visualizations which I played around with using an aviation-related dataset and I want to share my thoughts on both.

## Facets Overview

The documentation is available [here](https://github.com/PAIR-code/facets/blob/master/facets_overview/README.md).

![Facets Overview]("/assets/images/facets-overview.png")
