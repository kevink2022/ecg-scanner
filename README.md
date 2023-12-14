# ECG Scanner

Fall 2022 Capstone project at Penn State. This is a clone of the [original repository](https://github.com/pqn5106/CHOT-Project) for portfolio purposes.

The ECG Scanner app was created to convert ECG paper records into digital format for easier analysis and sharing. We utilized the combined strengths of Swift for iOS app development, Python for back-end processing, and a REST API to connect the two.
## What I Learned

### Technical Skills
- REST APIs
- SwiftUI and Swift Charts
### Practical Lessions:
- Coordination of separate, specialized teams.
## App Functionality

Upon launching the app, users are guided to scan their ECG documents using the integrated iOS document scanner. The scanner allows for capturing multiple documents in one session. After scanning, the documents are converted from HEIC to JPEG and uploaded to the server through a REST API.

The server-side processing involves segmenting the ECG scan into 12 individual signals, each digitized into an array of floats. This data, along with the original scan and associated metadata, is then saved locally on the user's iOS device. Users then can view past digitized signals (utilizing Swift Charts) along with the original scan image and some other information about the scan within the app.