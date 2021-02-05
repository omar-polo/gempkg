# GemPKG

GemPKG is a Gemini interface for the OpenBSD ports tree implemented as
a python3 CGI script.  It features a sqlite-powered full text search,
ports pages and per-category listings.

A live version run by [gmid](https://github.com/omar-polo/gmid) can be
found at
[gemini://gemini.omarpolo.com/cgi/gempkg](gemini://gemini.omarpolo.com/cgi/gempkg).


# Installation

GemPKG needs a customized version of the sqlite database provided by
the sqlports package: run `make` to generate the `gempkg.sqlite`
database.

Then copy the CGI script where your preferred Gemini server will
execute it and make sure that the environment variable `$SQLPORTS`
contains the path to `gempkg.sqlite`.


# Compatibility

CGI compliance may vary between Gemini servers.  GemPKG requires the
following variables to be set:

 - `$QUERY_STRING`: must contain the **URL-encoded** query string, if
   any.
 - `$SCRIPT_NAME`: public path to the script (e.g. `/cgi-bin/gempkg`)
 - `$PATH_INFO`: the part of the path past the script,
   e.g. `/lang/sbcl/` if the request is `/cgi-bin/gempkg/lang/sbcl`.

In addition, `$SQLPORTS` must point to `gempkg.sqlite` (otherwise you
can edit the first lines of the script to hardcode a path).
