# Done Yo

[![Code Climate](https://codeclimate.com/github/codeout/doneyo.png)](https://codeclimate.com/github/codeout/doneyo)

Yo you when time-consuming shell commands are done.


## Usage

Invoke ```yo``` just after a task which takes long is done.

```shell
$ sleep 5; yo
```

## Installation

You can choose one of three options:

### 1. Rubygem

```shell
$ gem install doneyo
```

### 2. Go

```shell
$ go get github.com/codeout/doneyo/go/yo
```

### 3. Download a Binary

1. Download a zip archive for your system from [the release page](https://github.com/codeout/doneyo/releases/latest).
2. Extract it into somewhere in your $PATH.

## Configuration

Doneyo will look in ```~/.yorc``` for your Yo username to notify.

```
# ~/.yorc
[user]
name = your_yo_username
```
