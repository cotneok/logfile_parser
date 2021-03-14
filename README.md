# logfile_parser
## Test Description:
```
Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views 
         etc...
```

## How To Install
``` 
Clone repository: git clone git@github.com:cotneok/logfile_parser.git 
Go into the directory: cd logfile_parser
Run: bundle install
``` 


## How To Run App
``` 
ruby ./bin/parser.rb webserver.log
```

## How To Run Specs/rubocop
```
Run all tests: rspec
Run rubocop: rubocop 
```

## Approach Description

Due to the time constraint, my approach was to make simple working application that is using SOLID design patterns 
to make easy to read and reusable code, which then can be improved and extended. 

Main app logic is concentrated in the `./bin/parser.rb` file which has following flow:
- Checks whether file path is provided and if file exists on this path;
- If file exists it is being read and entries put into struct;
- These entries are passed into sorter class and new instance is created;
- Sort method is invoked on these entries, with unique (true/false) param;
- Result is printed into terminal;


## Possible Improvements
```
add validations for the file content (i.e. check if valid ip addresses are provided);
add validation for the correct file extension;
add github actions to check code quality and errors every time new PR is created or new code pushed to the repository;
```