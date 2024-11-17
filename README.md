# ScanTheNet-BASH
BASH API Data Fetcher.

This project is a BASH application that retrieves and displays data from our API endpoint. 

## Features

- **API Interaction**: Makes GET requests to our API endpoint and retrieves JSON data.
- **Dynamic Entry Limit**: Users can specify the maximum number of data entries to display (up to 100).

## Requirements

- **curl**
- **jq**

## Installation

### Install Dependencies

For Debian-based systems, you can install the required dependencies:

```
apt install curl jq
```

Clone the Repository

```
git clone https://github.com/ScanThe-Net/ScanTheNet-BASH.git
cd ScanTheNet-BASH
```

Usage

Run it from the command line. Optionally, you can specify the maximum number of entries:

```
bash scanthenet.sh [maxEntries]
```

Replace [maxEntries] with a number between 1 and 100. If not specified, the default value is 100.

Example Output

When executed successfully, it will display results in the following format:

```
  _______                    _______ __           ____ __         __
 |     __|.----.---.-.----- |_     _|  |--.-----.|    |  |.-----.|  |_
 |__     ||  __|  _  |     |  |   | |     |  -__||       ||  -__||   _|
 |_______||____|___._|__|__|  |___| |__|__|_____||__|____||_____||____|

6098834
Timestamp: 2024-11-17 10:19:13
Source IP: 138.68.101.113
Source Port: 44838
Destination Port: 22
Data: Flags [S], seq 2047609139, win 64240, options [mss 1400,sackOK,TS val 1460140717 ecr 0,nop,wscale 7], length 0
----------
```
