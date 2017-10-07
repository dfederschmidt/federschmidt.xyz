---
layout: "single"
title:  "Deep Spam - Do I really have a distant rich relative?"
date:   2016-08-03
categories: data
---

On the 23th of August, I received a concerning email with the following text:

>My late client Mr.Bryant died and left huge amount of money in a bank without any beneficiary. Since you have a similiar last name and share nationality with him, you shall be entitled to his unclaimed funds as a next of kin. Get back to me for details. - John

The sender was a certain John Chidiebele, probably a shooting star among notaries going through great lengths to make sure unclaimed funds find a recepting person.

What I noticed was that he stated that I have a last name to the deceased Mr. Bryant. But how similiar is my name really?

### Comparing "Federschmidt" with "Bryant"

One method to assign a score to a matching of two strings is the [Hamming Distance](https://en.wikipedia.org/wiki/Hamming_distance). But since it is only defined for strings of equal length I use the [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) which is also referred to as *edit distance*.

While the implementation is not difficult - There is already a [python package](https://github.com/ztane/python-Levenshtein/) for that.

```python
import Levenshtein
Levenshtein.distance("Bryant","Federschmidt") # yields 10
```


So the minimal number of operations (adding, removing or substituting a character) to change "Bryant" to "Federschmidt" is 10.
