# Log::Parser

A script/application that parses web requests log. It receives a plain text file containing requested web pages and associated request ip addresses and returns both a list of web pages with most page views ordered from most pages views to less page views and a list of web pages with most unique page views also ordered.


## Usage

 A Dockerfile is included to enable ease of execution on either Linux, mac or windows. To run on Linux, make sure to have docker installed on your machine and follow the instructions below:

1. $ git clone https://github.com/harryobas/log-parser.git

2. $ cd log-parser

3. $ sudo docker build . -t "parser"

4. $ sudo docker run -i -t parser:latest

5. log-parser# bin/parser webserver.log

NB: The file webserver.log is already included in the project root folder
