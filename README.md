iOSCircularProgressBar
======================

Circular Style Progress Bar



![      ](\CircularProgressBar.gif "") 


* Small code 
* Easy to modify 

<em>This UI control can be used on all iPhones, iPods & iPads running iOS 5.0 and above.</em>

---
---

### Adding to your project


* Add Follwing two files to your project

```
'ADCircularProgressView.h'
'ADCircularProgressView.m'
```

---
---

### How to use

#### Sample Codes

```obj-c

//1.  IMPORT
#import "ADCircularProgressView.h"



//2. CREATING INSTANCE OF CONTROL


   _adCircularProgressView = [[ADCircularProgressView alloc] initWithFrame:_viewForCircularProgress.bounds];//use whichever you want to set as frame (i adding it over view _viewForCircularProgress, so setting it's bound as frame)


//3. UPDATING PROGRESS PERCENT

    [_adCircularProgressView updatePecentage:_iPercentageToShow];//pass any int between 0-100
    

```


---
---

### Requirements

ADCircularProgressView works on iOS 5.0 & above versions and is compatible with ARC projects. There is no need of other frameworks/libraries

---
---

### Other details

* XCode : Developed using 6.1
* Base sdk used while development : 8.1
---
---

### TODO

* Component polishing

---
---
