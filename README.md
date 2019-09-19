# BlueBoard Mobile Application

## How to build model?

Run command:

```
flutter pub run build_runner build
```

## How to debug on wifi

From a command line on the computer that has the device connected via USB, issue the commands:

```
adb tcpip 5555
adb connect 192.168.0.101:5555
```

Be sure to replace *192.168.0.101* with the IP address that is actually assigned to your device. Once you are done, you can disconnect from the adb tcp session by running:

```
adb disconnect 192.168.0.101:5555
```