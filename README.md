# Done Yo

[![Code Climate](https://codeclimate.com/github/codeout/doneyo.png)](https://codeclimate.com/github/codeout/doneyo)

Yo you when time-consuming shell commands are done.


## Usage

Invoke ```yo``` just after a task which takes long is done.

```shell
$ sleep 5; yo
```

## Installation

You can choose one of two options:

### Rubygem

```shell
$ gem install doneyo
```

### Go

```shell
$ go get github.com/codeout/doneyo/go/yo
```

## Configuration

Doneyo will look in ```~/.yorc``` for your Yo username.

```
# ~/.yorc
[user]
name = your_yo_username
```
