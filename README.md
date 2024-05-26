# Wordlist Generator Script

This script generates wordlists using the `cewl` tool for one or multiple URLs specified in a text file.

## Description

The Wordlist Generator Script is a bash script that automates the process of generating wordlists from URLs. It utilizes the `cewl` tool to crawl web pages and extract words, which are then saved to individual files based on the URLs.

## Features

- Generates wordlists from one or multiple URLs specified in a text file
- Saves wordlists to individual files based on the URLs
- Provides usage instructions and examples
- Supports displaying help message

## Prerequisites

- Linux environment
- Bash shell
- `cewl` tool installed (can be installed via `apt-get`)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/wordlist-generator.git


Navigate to the cloned directory:

bash

    cd wordlist-generator


Ensure the script is executable:


bash

    chmod +x create_wordlist.sh


Usage


bash

    ./create_wordlist.sh [options] <input_file>


Options

    -h, --help: Display help message

Arguments

  input_file: Path to a text file containing URLs (one per line) to generate wordlists from

Example

Generate wordlists from a file containing URLs:

bash

    ./create_wordlist.sh /path/to/urls.txt

The input file should contain URLs, one per line:

arduino

    http://example.com
    https://another-example.com

