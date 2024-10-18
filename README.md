# FIleSync: WiFi File Sharing Application

FileSync is a file-sharing application, targeting Linux, Mac, Windows and Android platforms
![screenshot](./screenshots/filesync.png)

## Disclaimer

_⚠️ The application is still a work in progress and was recently migrated to use [Tauri v2(beta)](https://v2.tauri.app/) thus some features may be inconsistent. To proceed anyway, see the [release page](https://github.com/opeolluwa/filesync/releases)_

## Getting Started

### General Requirement

To compile the application or modify it locally, you need the following dependencies:

- [Node.js](https://nodejs.org) - A JavaScript Runtime environment
- [npm](https://npmjs.com) - A JavaScript package manager.
- [Rust v1.70 or greater](https://www.rust-lang.org/)
- [Android Studio](https://developer.android.com/studio?gad_source=1&gclid=CjwKCAjwnqK1BhBvEiwAi7o0XxODlu3Mk1cb2BoP1HV7g32vB5N37BVL5ab6OJ-3UAfpfkWmBM2nlRoCBfoQAvD_BwE&gclsrc=aw.ds) To build and debug the Android application to build reliable and efficient software.

Once you have the dependencies installed, clone the project and install the required packages:


### Workspace Requirements 

The project may require some system requirements based on your platform see the necessary 
[prerequisite](https://v2.tauri.app/start/prerequisites/) for your operating system.


```sh
git clone https://github.com/opeolluwa/filesync.git
cd filesync 
npm run install
```



## Roadmap

- [ ] Adaptive UI `WIP`
- [ ] Build an executable for the Mac operating system `WIP`
- [ ] Build an executable for the Linux Operating system `WIP`
- [ ] Build an executable for Window `WIP`
- [ ] Support mobile devices `WIP`
- [ ] Create a wifi hotspot on Unix Operating Systems
- [ ] Support dark mode
- [ ] Add walkthrough after installation


## Acknowledgments

- [Linux Wifi Hotspot](https://awesomeopensource.com/project/elangosundar/awesome-README-templateshttps://github.com/lakinduakash/linux-wifi-hotspot)
- [File Streaming](https://github.com/tokio-rs/axum/tree/main/examples/stream-to-file)

## Contributing

Contributions are always welcome!

See [contributing.md](./CONTRIBUTING.md) for ways to get started.

Please adhere to this project's [code of conduct](CODE_OF_CONDUCT.md).

## License

This project is distributed under the [MIT License](./LICENSE)
