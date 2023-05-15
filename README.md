# ASSIGNMENT

I want you to build a Ruby application without any frameworks, but you can use other stacks like databases if necessary. The application is to count how many files are inside a path with the SAME content. It could have the same name or not.

For example, I have folders with 5 files:
3 files have the same content, the content is “abcdef”, and the others have different content

In this case if I pass the folder's path, the script will return me the number of files that have the same content. On those folders content1 = content2 = content3, So the application will return content + number. So in this case is: abcdef 3

Also you need to return the bigger number of files if there are multiple files with the same content. For example, if there are 4 files with content “abcdef” and 5 files with content “abcd” then the return value should be: abcd 5

Please take note that the example files are in bytes level, but the code needs to be able to handle big files as well. Think of Megabytes, Gigabytes level. And the application needs to be able to handle tens/hundreds/thousands/millions of files.

The other requirement is I want this app to scan a path DYNAMICALLY. This means I should be able to scan any folder that I like, without changing anything on the code. It could be a parameter or a config file.

![Test](https://github.com/adiwids/virtualspirit_coding_test/actions/workflows/test.yml/badge.svg?branch=main)

## Requirement

* Ruby `2.7` and above
* `minitest` gem

## Run Test

```
$ ruby test/*_test.rb
```

## Run Command

```
$ ruby scan.rb --path /path/to/directory --file-ext txt
# Output: {file content} {files count}
```
