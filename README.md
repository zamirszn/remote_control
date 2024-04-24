

# Remote Control App

The Remote Control App is a Flutter-based mobile application that enables users to control their home devices, such as Samsung TV, Roku, and more, using their smartphones as remote controls. The app supports both IR (Infrared) and Wi-Fi remote control technologies, allowing users to seamlessly interact with a wide range of compatible devices.

## Features

- **IR Remote Control**: Utilizes the device's IR blaster to control compatible devices supporting IR communication.
- **Wi-Fi Remote Control**: Integrates ConnectSDK to control devices over Wi-Fi networks, enabling communication with a broader range of smart home devices.
- **Multi-Device Support**: Supports controlling various home devices, including Samsung TVs, Roku, and other compatible devices.
- **Intuitive Interface**: Provides a user-friendly interface with intuitive controls for easy navigation and device management.
- **Method Channels Integration**: Uses Flutter's method channels to establish communication between Flutter and Java code for device control functionalities.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/zamirszn/remote_control.git
   ```

2. Navigate to the project directory:

   ```bash
   cd remote_control
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Build and run the app on your preferred device:

   ```bash
   flutter run
   ```

## Usage

1. Launch the Remote Control App on your smartphone.
2. Select the desired device from the list of supported devices.
3. Use the on-screen controls to interact with the selected device (e.g., change channels, adjust volume, navigate menus).
4. For IR-controlled devices, ensure that your smartphone's IR blaster is properly aligned with the target device.
5. For Wi-Fi-controlled devices, make sure your smartphone is connected to the same Wi-Fi network as the target device.

## Contributing

Contributions to the Remote Control App are welcome! Here are a few ways you can contribute:

- Report bugs and suggest improvements by opening an issue.
- Implement new features or enhancements and submit pull requests.
- Improve documentation to make it more informative and user-friendly.

## License

This project is licensed under the [MIT License](LICENSE).

