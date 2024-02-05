# AdParameters Application

## Overview

In developing the code, I aimed to prioritize readability and simplicity to ensure it remains straightforward and easy to understand. While I recognize there is room for improvement in terms of dependency injection, I opted to avoid adding complexity to maintain the code's approachability and ease of maintenance. 


## Technologies used

ruby 3.2.2
sinatra
google-protobuf
rubocop
ruby-lsp
rspec

## Generating Output

To generate stdout:
```ruby
ruby print_stdout.rb creatives_and_placements.xml
```

The output will be:

```bash
BINARY:
"\nI\n\x05plc-1\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-7\x15\xF2\xD2\x9B@\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\x9B\xE6\x05A\n)\n\x05plc-2\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\x9B\xE6\x05A\nI\n\x05plc-3\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-7\x15\xF2\xD2\x9B@\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\x9B\xE6\x05A\n\a\n\x05plc-4\n\a\n\x05plc-5\nI\n\x05plc-6\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-7\x15\xF2\xD2\x9B@\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\x9B\xE6\x05A\nY\n\x05plc-7\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-4\x15\xE4\x83~?\x12\x0E\n\aVideo-7\x15\xF2\xD2\x9B@\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\x9B\xE6\x05A\nI\n\x05plc-8\x12\x0E\n\aVideo-1\x15I\x9D\xCE@\x12\x0E\n\aVideo-7\x15\xF2\xD2\x9B@\x12\x0F\n\bVideo-12\x15R\xA7\x83A\x12\x0F\n\bVideo-25\x15\x9B\xE6\x05A"
```


## BONUS Task

### Building the Docker Image

```bash
docker build -t add_parameters_app .
docker run -p 9292:9292 add_parameters_app
```

Access the application at 
`http://localhost:9292/search?plc-2&price=1.3456`

The return of this endpoint in json should be:

```json
{
  "id": "Video-7",
  "price": 4.8695
}
```
