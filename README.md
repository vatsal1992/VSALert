# ``VSAlert``

This is replacement of native ``UIAlertController``. This library allows user to customise title, messages and action buttons. This library also allows user to show ``UIActivityIndicatorView`` to show loading.

## Overview



## Topics

### ``VSAlertActionConfiguration``
To customize ``VSAlertAction``.


To change text color, Default value ``.black``
>``var forgroundColor:UIColor``


To change background color, Default value ``.white``
>``var backgroundColor:UIColor``


To change corner radius of button, Default value ``8``
>``var cornerRadius:CGFloat``

### ``VSAlertConfiguration``
To customize ``VSAlertController``.


To change title font, Default value ``.systemFont(ofSize: 17, weight: .bold)``
>``var titleFont:UIFont``

To change message font, Default value ``.systemFont(ofSize: 14, weight: .regular)``
>``var messageFont:UIFont``

To change title color, Default value ``.black``
>``var titleColor:UIColor``

To change message color, Default value ``.black``
>``var messageColor:UIColor``

To change activity color, Default value ``.black``
>``var activityColor:UIColor``

To change alert background color, Default value ``.white``
>``var alertBackgroundColor:UIColor``

To show/hide UIActivityIndicatorView when presenting alert, Default value ``false``
>``var showActivity:Bool``

To change corner radius of VSAlert, Default value ``16``
>``var cornerRadius:CGFloat``

### ``VSAlertController``

```swift
//Example - 1 (With Action button)
var config = VSAlertConfiguration.config
let alert = VSAlertController(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",configuration: config)

var config1 = VSAlertActionConfiguration.config
config1.backgroundColor = .red
config1.forgroundColor = .white
let action1 = VSAlertAction(title: "Action1", actionStyle: config1) { _ in
}
alert.addAction(action1)
alert.present(on: self, completion: nil)

//Example - 2 (Without Action button, shows only title, message & UIActivityIndicatorView
var config = VSAlertConfiguration.config
config.showActivity = true
let alert = VSAlertController(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",configuration: config)
        
alert.present(on: self, completion: nil)
```
